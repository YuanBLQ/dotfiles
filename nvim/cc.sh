arg="$1"

if [ "$arg" = "lazy" ]; then
    echo "changing to lazy mode..."
    rm -f ~/.config/nvim/base.vim
    rm -f ~/.config/nvim/init.vim
    rm -f ~/.config/nvim/init.lua
    rm -f ~/.config/nvim/lsp
    rm -f ~/.config/nvim/lua

    ln -sf "$PWD/lazy/base.vim" ~/.config/nvim/base.vim
    ln -sf "$PWD/lazy/init.lua" ~/.config/nvim/init.lua
    ln -sf "$PWD/lazy/lsp" ~/.config/nvim/lsp
    ln -sf "$PWD/lazy/lua" ~/.config/nvim/lua
    echo "done"
elif [ "$arg" = "vims" ]; then
    echo "changing to vimscript mode..."
    rm -f ~/.config/nvim/base.vim
    rm -f ~/.config/nvim/init.vim
    rm -f ~/.config/nvim/init.lua
    rm -f ~/.config/nvim/lsp
    rm -f ~/.config/nvim/lua

    ln -sf "$PWD/vimscript/base.vim" ~/.config/nvim/base.vim
    ln -sf "$PWD/vimscript/init.vim" ~/.config/nvim/init.vim
    ln -sf "$PWD/vimscript/lsp" ~/.config/nvim/lsp
    ln -sf "$PWD/vimscript/lua" ~/.config/nvim/lua
    echo "done"
else
    echo "unknown command"
fi
