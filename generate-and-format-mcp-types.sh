set -e
cabal run mcp-types-gen
find . -type f \( -name "*.hs" -o -name "*.lhs" \) -exec stylish-haskell -i {} +
