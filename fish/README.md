## starship prompt

### 安装
`curl -sS https://starship.rs/install.sh | sh` or `brew install starship`

### 配置
`~/.config/starship.toml`


## fisher

### [安装](https://github.com/jorgebucaran/fisher)
`curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher`

### 插件
- fisher install jorgebucaran/fisher
- fisher install jethrokuan/z
- fisher install PatrickF1/fzf.fish


## 相关系统插件安装
- fd: `brew install fd`
- bat: `brew install bat`
- fzf: `brew install fzf`


## 加载自定义环境变量

两种方式：

1. direnv，自动加载环境变量（但是格式有点奇怪）。

2. fish script，手动加载环境变量（但是格式规范）。

### direnv

#### 安装
`brew install direnv`

#### 配置
Add the following line at the end of the `~/.config/fish/config.fish` file:

```sh
direnv hook fish | source
```

配置之后，如果进入的文件夹下有`.envrc`文件，direnv会自动加载该文件，设置环境变量。

`.envrc` 文件内容格式：
```sh
export FOO=bar
```

### fish script

在包含有 `.env` 文件的文件夹下，执行 `dotenv` 命令，加载环境变量。
