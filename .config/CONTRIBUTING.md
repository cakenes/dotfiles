# Contributing Guide

This document describes the code style, patterns, and conventions used in this codebase. Follow these exactly when adding or modifying code.

---

## Tooling

- **Formatter / Linter**: [Biome](https://biomejs.dev/)
- **Tests**: [Vitest](https://vitest.dev/)
- **Framework**: Next.js App Router (TypeScript)

Run checks locally:

```sh
npx biome check src/
npx vitest run
```

---

## Formatting

Enforced by Biome — do not override manually:

| Rule | Value |
|---|---|
| Indent | 2 spaces |
| Line width | 120 |
| Quotes | Single |
| Semicolons | As needed (omit where optional) |

---

## TypeScript

### Explicit types

No infer types. Use explicit ones.

```ts
// do
export interface General {
  metric: boolean
  units: boolean
}

// don't
type General = z.infer<typeof generalPutRequest>
```

### No non-null assertions

Never use `!`. Filter, guard, or use a type cast instead:

```ts
// do
const uuid = auth.uuid as string

// don't
const uuid = auth.uuid!
```

### No nullish coalescing (`??`)

No `??` unless allowing `null` values is required. Use `||` for general fallbacks.
This prevents us from designing around `null` values.

```ts
// do
user: auth?.uuid || 'Unknown'

// don't
user: auth?.uuid ?? 'Unknown'
```

### No SCREAMING_SNAKE_CASE for constants

Use camelCase for all constants:

```ts
// do
const maxSize = 10
const allowedTypes = ['jpg', 'png']

// don't
const MAX_SIZE = 10
const ALLOWED_TYPES = ['jpg', 'png']
```

### Loops — `for...of` or `.map()`

Use `for...of` when looping for side effects, `.map()` when transforming into a new array.
No `forEach`, `for...in`, or C-style `for` loops.

```ts
// do side effects
for (const club of parsedBody.data) {
  await Query('INSERT ...', [club.sort_order, club.name])
}

// do transformation
const names = users.map((user) => user.user_name)

// don't
parsedBody.data.forEach(async (club) => { ... })
for (let i = 0; i < items.length; i++) { ... }
```

### No intermediate variables

No intermediate variables unless they genuinely improve readability.
Use expressions directly where possible.

```ts
// do
if (!user?.uuid) return

// don't
const enabled = !!user?.uuid
if (!enabled) return
```

### No destructuring

No destructuring unless the value is used more than once or it genuinely improves readability.
Access properties directly otherwise.

```ts
// do — direct access is fine
return loggedNextResponse({ user: auth.uuid || 'Unknown', ... })

// do — destructuring is fine when the value is used repeatedly
const { uuid, debug } = auth

// don't — destructuring only to use it once
const { uuid } = auth
return loggedNextResponse({ user: uuid || 'Unknown', ... })
```

---

## Project Structure

```
src/
  app/api/          # Next.js API route handlers (route.ts + route.test.ts)
  handlers/         # Client-side fetch wrappers (call the API routes)
  schemas/          # Zod validation schemas for API request bodies
  types/            # Shared TypeScript interfaces
    postgres.ts     # Pg* prefixed DB row types
    redis.ts        # Redis entry types
  context/          # React context providers
  components/       # React UI components
  hooks/            # Custom React hooks
  utils/            # Shared utilities (auth, db, logs, etc.)
```

---

## API Routes (`src/app/api/`)

Each route lives in its own folder with a `route.ts` and `route.test.ts`. When adding a new route, also add an entry to `src/app/api/RATELIMIT.md`.

### Handler pattern

Every HTTP method follows this exact order:

1. Declare `let auth` and `let body` (if needed) **before** the try block
2. `getAuth()` — return early on error
3. `limitByUuid()` — return early on rate limit
4. `req.json()` + `safeParse()` — return 400 on failure
5. DB query / business logic
6. Return via `loggedNextResponse()`
7. Catch block returns 500 via `loggedNextResponse()`

```ts
export const PUT = async (req: NextRequest): Promise<NextResponse> => {
  let body: unknown
  let auth: AuthResult | null = null

  try {
    auth = await getAuth()
    if (auth.error) return auth.error

    const rateLimit = await limitByUuid(auth.uuid, 2, auth.rate_limit)
    if (rateLimit) return rateLimit

    body = await req.json()
    const parsedBody = mySchema.safeParse(body)

    if (!parsedBody.success) {
      return loggedNextResponse({
        user: auth?.uuid || 'Unknown',
        status: 400,
        route: '/api/user/example',
        method: 'PUT',
        debug: auth?.debug,
        message: 'error.invalid_input',
        request: body,
        data: parsedBody.error,
      })
    }

    await Query('...', [...])

    return loggedNextResponse({
      user: auth?.uuid || 'Unknown',
      status: 200,
      route: '/api/user/example',
      method: 'PUT',
      debug: auth?.debug,
      message: 'Updated successfully',
      request: body,
      data: true,
    })
  } catch (error) {
    return loggedNextResponse({
      user: auth?.uuid || 'Unknown',
      status: 500,
      route: '/api/user/example',
      method: 'PUT',
      debug: true,
      message: 'error.internal',
      request: body,
      data: error,
    })
  }
}
```

### `loggedNextResponse` rules

- Always pass `user: auth?.uuid || 'Unknown'`
- Always pass `debug: auth?.debug` on success/4xx, `debug: true` on 5xx
- Error messages use `error.*` i18n keys (e.g. `'error.invalid_input'`, `'error.internal'`)
- Success `data` is the actual payload; error `data` is the error object

---

## Schemas (`src/schemas/`)

Use Zod. Export named schema constants (camelCase). Never export inferred types — write explicit interfaces instead.

```ts
import z from 'zod'

export const myPutRequest = z.object({
  name: z.string().trim(),
  count: z.coerce.number().int().min(0),
})
```

---

## Types (`src/types/`)

- Database row types are in `postgres.ts` and prefixed with `Pg` (e.g. `PgUser`, `PgRound`)
- Redis entry types are in `redis.ts`
- Use `interface` for object shapes; `type` for unions/aliases

---

## Client Handlers (`src/handlers/`)

Thin wrappers around `fetchWithAuthRetry`. Validate with `safeParse` before sending; throw on validation failure.

```ts
export const upsertExample = async (data: MyType): Promise<boolean> => {
  const validation = myPutRequest.safeParse(data)
  if (validation.error) throw new Error('error.invalid_input')

  const res = await fetchWithAuthRetry('api/user/example', {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  })

  return handleApiResponse(res)
}
```

---

## React Contexts (`src/context/`)

- Export a `use*Context` hook that throws if used outside the provider
- State is in the provider; the context value is the public interface
- Define the state interface and provider props interface explicitly

```ts
interface ExampleState {
  value: string
  setValue: Dispatch<SetStateAction<string>>
}

const ExampleContext = createContext<ExampleState | undefined>(undefined)

export const useExampleContext = () => {
  const context = useContext(ExampleContext)
  if (!context) throw new Error('useExampleContext must be used within ExampleProvider')
  return context
}
```

---

## React Components (`src/components/`)

- Always type components as `FC` (or `FC<Props>`)
- Props interfaces are defined in the same file
- Use `Fragment` instead of `<>` for wrapping
- UI library: [Ant Design](https://ant.design/)

```ts
interface MyComponentProps {
  label: string
}

export const MyComponent: FC<MyComponentProps> = ({ label }) => {
  return (
    <Fragment>
      <Typography.Text>{label}</Typography.Text>
    </Fragment>
  )
}
```

---

## Tests (`src/app/api/**/*.test.ts`)

- One `route.test.ts` per route folder
- Use `describe('/api/user/route', () => { describe('METHOD', ...) })` structure
- Import `makeRequest`, `QueryMock`, `getAuthMock`, `validUuid` from `@/utils/test/helper`
- Use `vi.hoisted()` for any mock variables referenced inside `vi.mock()` factory functions (since `vi.mock()` is hoisted before variable declarations)
- Call `vi.clearAllMocks()` in `beforeEach`

```ts
import type { NextRequest } from 'next/server'
import { beforeEach, describe, expect, it, vi } from 'vitest'
import { getAuthMock, makeRequest, QueryMock, validUuid } from '../../../../utils/test/helper'
import { GET, PUT } from './route'

describe('/api/user/example', () => {
  beforeEach(() => vi.clearAllMocks())

  describe('GET', () => {
    it('returns 401 if uuid is missing', async () => {
      const req = makeRequest(undefined, null)
      const res = await GET(req as unknown as NextRequest)
      expect(res.status).toBe(401)
    })

    it('returns 200 with data', async () => {
      QueryMock.mockResolvedValueOnce([{ id: 1 }])
      const req = makeRequest(undefined, validUuid)
      const res = await GET(req as unknown as NextRequest)
      expect(res.status).toBe(200)
    })

    it('returns 500 on DB error', async () => {
      QueryMock.mockImplementationOnce(() => { throw new Error('DB error') })
      const req = makeRequest(undefined, validUuid)
      const res = await GET(req as unknown as NextRequest)
      expect(res.status).toBe(500)
    })
  })
})
```

### Required test cases per method

Cover at minimum:
- `401` — missing auth (pass `null` as uuid to `makeRequest`)
- `400` — invalid body (body that fails `safeParse`)
- `200` — happy path
- `500` — DB/unexpected error (mock the function to throw)

---

## Comments

Only add comments when a piece of code genuinely needs clarification.
What are we doing if code is not self-explanatory?

### Mock comments in tests

When mocking a return value in test files, add an inline comment after the mock describing what is being mocked and what it returns (this is an exception to the general "Only add comments..." guidance, since mocks hide intent).
Use `->` to separate the subject from the outcome.

```ts
QueryMock.mockResolvedValueOnce([user]) // SELECT users by email -> user found
  .mockResolvedValueOnce([]) // UPDATE users SET last_login_at -> no rows returned
  .mockResolvedValueOnce([]) // SELECT course_admins -> no admin courses
  .mockResolvedValueOnce([{ uuid: validUuid }]) // INSERT session_users -> session UUID

vi.spyOn(bcrypt, 'compare').mockResolvedValue(true as any) // bcrypt.compare -> valid password
```

---

## Changes to contributing

We can make changes here as needed, lets keep the codebase clean and consistent by following these guidelines.
With changes, we should also update existing code to match the new guidelines.
