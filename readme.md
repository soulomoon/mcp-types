## mcp-types

This project generates Haskell types for the Model Context Protocol (MCP) from the [official schema](https://github.com/modelcontextprotocol/modelcontextprotocol/blob/main/schema/2025-03-26/schema.json).

### Features

- Auto-generates Haskell types and JSON instances from the MCP schema
- Property-based roundtrip tests for all types
- Code formatting with `stylish-haskell`
- Pre-commit hooks for formatting and code hygiene

### Getting Started

#### Prerequisites

- [GHC](https://www.haskell.org/ghc/) (>=9.0)
- [cabal](https://www.haskell.org/cabal/) or [stack](https://docs.haskellstack.org/en/stable/README/)
- [stylish-haskell](https://github.com/haskell/stylish-haskell) (`brew install stylish-haskell` or `stack install stylish-haskell`)
- [pre-commit](https://pre-commit.com/) (`pip install pre-commit`)

#### Generating and Formatting Types

To generate and format all MCP types from the schema, run:

```bash
./generate-and-format-mcp-types.sh
```

This will:
- Parse the schema in `meta/schema.json`
- Generate Haskell types and instances in `mcp-types/src/Network/Protocol/MCP/Types/`
- Format all generated files with `stylish-haskell`

#### Formatting

To format all Haskell files in the repo:

```bash
find . -type f \( -name "*.hs" -o -name "*.lhs" \) -exec stylish-haskell -i {} +
```

#### Pre-commit Hooks

To enable pre-commit hooks (recommended):

```bash
pre-commit install
```

#### Running Tests

To run all property-based and unit tests:

```bash
cabal test
```

### Project Structure

- `mcp-types/` — Generated types and instances
- `mcp-types/test/` — Property-based and unit tests
- `mcp-types-gen/` — Code generator
- `meta/schema.json` — MCP schema source

### Todo

- [x] Generate ToJSON and FromJSON for all types
- [x] Add property-based roundtrip tests
- [x] Add code formatting and pre-commit hooks
- [ ] Add more unit tests
- [ ] Add github actions for CI
- [ ] Support more ghc versions

### Contributing

- Please run formatting and tests before submitting a PR.
- See `.pre-commit-config.yaml` for code hygiene tools.

