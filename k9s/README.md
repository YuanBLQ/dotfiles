## skins
1. 把 skins 文件夹下的 `yaml` 文件放到 `$XDG_CONFIG_HOME/k9s/skins/` 文件夹下
    - 或者直接把 `skins` 文件夹软链过去: `ln -s /path/to/dotfiles/k9s/skins ~/.config/k9s/skins`
2. 更新 `$XDG_CONFIG_HOME/k9s/config.yaml` 下 `ui.skin` 字段:
```yaml
k9s:
  liveViewAutoRefresh: false
  screenDumpDir: /tmp/dumps
  refreshRate: 2
  maxConnRetry: 5
  readOnly: false
  noExitOnCtrlC: false
  ui:
    enableMouse: false
    headless: false
    logoless: false
    crumbsless: false
    noIcons: false
    # Toggles reactive UI. This option provide for watching on disk artifacts changes and update the UI live  Defaults to false.
    reactive: false
    # By default all contexts wil use the dracula skin unless explicitly overridden in the context config file.
    skin: tokyo  # <==
```
