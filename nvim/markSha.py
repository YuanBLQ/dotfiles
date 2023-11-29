"""
记录每个插件的最新 commit，方便后续更新插件时，如果崩了能快速回滚到之前的版本
"""

import os
import subprocess

NVIM_PLUG_FILE = os.path.expanduser("~/.config/nvim/init.vim")
NVIM_PLUG_BASE_DIR = os.path.expanduser("~/.config/nvim/plugs")
CMD_HEAD = ["git", "rev-parse", "HEAD"]
COMMIT_LINE_PREFIX = '" commit: '


def get_plug_head_commit(plug_name: str) -> str:
    # 进入插件目录
    plug_dir = os.path.join(NVIM_PLUG_BASE_DIR, plug_name)
    os.chdir(plug_dir)

    # 获取插件最新提交的commit
    return subprocess.check_output(CMD_HEAD).decode().strip()


def parse_for_plug_name(line: str) -> str:
    # Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'}
    return line.split("'")[1].split("/")[1]


def refresh_commit_record():
    with open(NVIM_PLUG_FILE, "r") as f:
        lines = f.read().split("\n")

    new_lines = []
    for line in lines:
        if line.startswith("Plug "):
            plug_name = parse_for_plug_name(line)
            commit = get_plug_head_commit(plug_name)
            if not commit:
                raise ValueError(f"获取插件 {plug_name} 最新的 commit 失败")

            # 先追加一行 commit 数据
            new_lines.append(f"{COMMIT_LINE_PREFIX}{commit}")
            print(f"{commit} => {plug_name}")

        # 如果之前有 commit 行数据，跳过
        if line.startswith(COMMIT_LINE_PREFIX):
            continue

        # 保留原始行数据
        new_lines.append(line)

    with open(NVIM_PLUG_FILE, "w") as f:
        f.write("\n".join(new_lines))


if __name__ == "__main__":
    refresh_commit_record()
