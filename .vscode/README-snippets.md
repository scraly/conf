
# Prerequisites

Install bots-garden/snippets tool:

```bash
$ SNIPPETS_VERSION="0.0.1"
$ SNIPPETS_OS="darwin" # or linux
$ SNIPPETS_ARCH="arm64" # or amd64
$ curl -L https://github.com/bots-garden/snippets/releases/download/v0.0.1/snippets-v0.0.1-darwin-arm64 -o snippets
```

# Generete code-snippets

```bash
$ snippets generate \
  --input snippets.yml \
  --output kubectl-season.code-snippets
🙂 kubectl-season.code-snippets generated
```

# Usage

in VSCode, in a shell script, type CTRL+ and then type "01-season" to use the first kubectl-season snippet :) 