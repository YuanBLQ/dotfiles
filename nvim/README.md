## 配置文件默认位置
```
~/.config/nvim/init.vim
```

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
4. Sql: `CocInstall coc-sql`
5. color: `CocInstall coc-highlight`
6. spell-checker: `CocInstall coc-spell-checker`

[cocUpdate 报错: `certificate has expired`](https://github.com/neoclide/coc.nvim/issues/1514#issuecomment-1272430040)


### treesitter 插件

1. Python: `TSInstall python`
2. Golang: `TSInstall go`
3. Proto: `TSInstall proto`
4. Lua: `TSInstall lua`
5. SQL: `TSInstall sql`
6. Markdow `TSInstall markdown`
7. MarkdowInline `TSInstall markdown_inline`
8. html: `TSInstall html`
9. html: `TSInstall css`
10. tsx: `TSInstall tsx`


### lspconfig

- Python: `pip install pyright`
- TypeScript: [`npm install -g typescript-language-server typescript`](https://github.com/typescript-language-server/typescript-language-server)
- Golang: [`go install golang.org/x/tools/gopls@latest`](https://github.com/golang/tools/tree/master/gopls)



### ale 依赖配置

1. protobuf lint & format: `brew install bufbuild/buf/buf`
2. clang-format: `brew install clang-format`
3. prettier:
    > ```
    > npm install --save-dev --save-exact prettier
    > ```
    >
    > Then, create an empty config file to let editors and other tools know you are using Prettier:
    > ```
    > touch .prettierrc
    > ```
    >
    > Next, create a `.prettierignore` file to let the Prettier CLI and editors know which files to not format. Here’s an example:
    > ```
    > echo "# Ignore artifacts:
    > build
    > coverage" > .prettierignore
    > ```
    >
    > Now, format all files with Prettier:
    > ```
    > npx prettier . --write
    > ```


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
