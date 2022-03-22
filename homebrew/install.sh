#!/bin/sh

# brewコマンドがなければインストール
if !(type brew &>/dev/null); then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Brewfileを実行
brew bundle

echo "👍 Homebrew setting is done!"
