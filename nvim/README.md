## 配置方式

### 系统插件

1. fzf: `brew install fzf`
2. fd: `brew install fd`
3. rg: `brew install ripgrep`


### nvim 插件

1. 安装 [`vim-plug`](https://github.com/junegunn/vim-plug)
2. 执行 `PlugInstall`


### coc 插件

1. Python: `CocInstall coc-pyright`
2. Golang: `CocInstall coc-go`
3. Json: `CocInstall coc-json`
4. color: `CocInstall coc-highlight`
5. spell-checker: `CocInstall coc-spell-checker`


### treesitter 插件

1. Python: `TSInstall python`
2. Golang: `TSInstall go`
3. Proto: `TSInstall proto`
4. Lua: `TSInstall lua`
5. Markdow `TSInstall markdown`
6. MarkdowInline `TSInstall markdown_inline`


### ale 依赖配置

1. protobuf lint & format: `brew install bufbuild/buf/buf`
2. clang-format: `brew install clang-format`


### copilot

install:

```
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

setup:

```
:Copilot setup
```

### Q&A

-  从 vim-plug 切换到 lazy.nvim，安装 treesitter 会报错，删掉 `$NVIM-HOME/lib/nvim/parser/` 下所有的 `.so` 文件即可。
- `nvim-tree` 删除报找不到 `trash`，通过此命令安装依赖：`brew install trash`
