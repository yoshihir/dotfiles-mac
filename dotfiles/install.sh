#!/bin/sh

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done


# Zinit (Zsh plugin manager)
sh -c "$(curl -fsSL https://git.io/zinit-install)"
echo ". .plugins.zsh" >> ~/.zshrc

echo "👍 dotfiles link is done!"
