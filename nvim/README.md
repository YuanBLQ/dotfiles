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


### treesitter 插件

1. Python: `TSInstall python`
2. Golang: `TSInstall go`
3. Proto: `TSInstall proto`


### ale 依赖配置

1. protobuf lint & format: `brew install bufbuild/buf/buf`
2. clang-format: `brew install clang-format`
