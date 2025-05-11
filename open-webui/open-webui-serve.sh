
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yu9824/opt/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yu9824/opt/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/yu9824/opt/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yu9824/opt/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate open-webui

export DATA_DIR=$(dirname $0)/data

# モデルを探しに行かないようにする
# 参考: https://github.com/open-webui/open-webui?tab=readme-ov-file#offline-mode
export HF_HUB_OFFLINE=1
# サーバーを建てる
open-webui serve --port 3000    # デフォルトは8080。
