# 默认位置
```
~/.tmux.conf
```

# 安装 TPM (tmux plugin manager)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 快捷键
- `PREFIX + I`: 安装新插件
- `PREFIX + U`: 更新已安装插件
- `PREFIX + alt + u`: 卸载已删除的插件


# 常用命令

## 调整 pane
- 顺/逆时针 旋转: `PREFIX + {`、`PREFIX + }`
- 把 pane 拆分到一个新的 window: `PREFIX + !`
- kill 当前 pane: `PREFIX + x`
- 把当前 window 下的 pane 都调成垂直排列: `PREFIX + alt + 1`
- 把当前 window 下的 pane 都调成水平排列: `PREFIX + alt + 2`
- 把当前 window 下的 主pane（0 号） 调成水平排列: `PREFIX + alt + 3`
- 把当前 window 下的 主pane（0 号） 调成垂直排列: `PREFIX + alt + 4`
