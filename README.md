## My Emacs Config

### Overview

This repository contains my personal Emacs setup, written **literate-style** in `config.org` and auto-tangled to `~/.emacs.d/config.el` on first launch (or whenever the org file is saved).

### Directory layout

```
.
├── config.org      ; literate config (tangled to ~/.emacs.d/config.el)
├── init.el         ; bootstrapper (lives in ~/.emacs.d via symlink)
└── snippets/       ; custom yasnippet collections
```

### Package list

| Package                                                                                                                | Purpose (in short)                                                              |
| ---------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| **exec-path-from-shell**                                                                                               | Import PATH/env vars on GUI macOS/Linux                                           |
| **doom-themes**                                                                                                        | Theme collection – loads `doom-one`                                               |
| **doom-modeline**                                                                                                      | Fancy mode-line with icons                                                        |
| **helpful**                                                                                                            | Better *Help* buffers                                                             |
| **undo-tree**                                                                                                          | Visual, persistent undo/redo                                                      |
| **expand-region**                                                                                                      | Grow/shrink selection semantically                                                |
| **company**                                                                                                            | In-buffer completion backend framework                                            |
| **vertico**                                                                                                            | Vertical minibuffer completion UI                                                 |
| **orderless**                                                                                                          | Fuzzy/partial matching style                                                      |
| **marginalia**                                                                                                         | Rich annotations in minibuffer lists                                              |
| **consult**                                                                                                            | Jump/search commands (buffer, line, grep…)                                        |
| **which-key**                                                                                                          | Pop-up for possible key bindings                                                  |
| **yasnippet**                                                                                                          | Snippet engine (+ your custom snippets)                                           |
| **flyspell / flyspell-correct**                                                                                        | On-the-fly spell-check & quick fixes                                              |
| **undo-tree**                                                                                                          | Time-traveling undo                                                               |
| **pdf-tools**                                                                                                          | Native PDF viewer/annotator                                                       |
| **markdown-mode**                                                                                                      | Major mode for Markdown/GFM                                                       |
| **auctex**, **cdlatex**                                                                                                | Powerful LaTeX editing & fast math entry                                          |
| **company-reftex**, **company-math**                                                                                   | LaTeX citation/math completions                                                   |
| **json-mode**, **csv-mode**, **yaml-mode**, **web-mode**                                                               | Extra file-type modes                                                             |
| **lsp-mode**, **lsp-ui**                                                                                               | Language Server Protocol client & UI                                              |
| **lsp-pyright**                                                                                                        | Python LSP (Pyright)                                                              |
| **flycheck**, **flycheck-pycheckers**                                                                                  | Syntax checking (generic + Python)                                                |
| **blacken**                                                                                                            | Run *Black* formatter on save                                                     |
| **pyvenv**                                                                                                             | Switch Python virtualenvs                                                         |
| **projectile**, **consult-projectile**                                                                                 | Project management / navigation                                                   |
| **magit**                                                                                                              | Git porcelain inside Emacs                                                        |
| **vterm**                                                                                                              | Fast libvterm-based terminal                                                      |
| **tramp**                                                                                                              | Edit remote files over SSH                                                        |
| **tablist**, **all-the-icons**, **lv**, **ht**, **go-projectile**, **list-packages-ext**, **company-jedi**, **xenops** | Misc helpers/icons or language-specifics (Go, Python Jedi backend, LaTeX preview) |

*(Packages pulled transitively by `use-package` are omitted.)*

### Installation & usage

```bash
# 1) Clone anywhere you like
git clone https://github.com/your-username/config-emacs ~/Projects/config-emacs

# 2) Symlink into ~/.emacs.d
ln -sf ~/Projects/config-emacs/init.el   ~/.emacs.d/init.el
ln -sf ~/Projects/config-emacs/config.org ~/.emacs.d/config.org
ln -sf ~/Projects/config-emacs/snippets   ~/.emacs.d/snippets

# 3) First launch
emacs     # Emacs tangles config.org → ~/.emacs.d/config.el and installs packages
```

**Updating**
Edit `config.org`, save – Emacs automatically retangles & reloads live.
Commit/push changes as normal Git workflow (`git add . && git commit -m "..." && git push`).

**First-time package install takes a minute**; subsequent starts are fast (startup time printed in mini-buffer).
