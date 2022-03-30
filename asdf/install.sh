#!/bin/sh

# asdfコマンドがなければasdfをインストール
if ! (type asdf > /dev/null 2>&1); then
  if ! (type brew > /dev/null 2>&1); then
    sh homebrew/install.sh
  fi
  brew install asdf
fi

# add to shell
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

# Default Packages(TODO: 置いて置くとdefault installできる後で必要になったら)
# basename -a "$PWD"/2_asdf/.default-* | xargs -I{} ln -sfv "$PWD"/2_asdf/{} ~/{}

# === asdf-nodejs ===
# Install plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# Install Node.js
asdf install nodejs latest
asdf global nodejs "$(asdf list nodejs | tail -1 | sed -e 's/ //g')"

# === asdf-python ===
# Install plugin
asdf plugin-add python https://github.com/danhper/asdf-python
# Install Python
asdf install python latest
asdf global python "$(asdf list python | tail -1 | sed -e 's/ //g')"

# === asdf-terraform ===
# Install plugin
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
# Install terraform
asdf install terraform latest
asdf global terraform "$(asdf list terraform | tail -1 | sed -e 's/ //g')"


# === asdf-java ===
# Install plugin
asdf plugin-add java https://github.com/halcyon/asdf-java.git
# Install java
asdf install java adoptopenjdk-17.0.2+8
asdf global java adoptopenjdk-17.0.2+8


# === asdf-gradle ===
# Install plugin
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
# Install java
asdf install gradle latest
asdf global gradle "$(asdf list gradle | tail -1 | sed -e 's/ //g')"

echo "asdf install list"
asdf current
echo "👍 asdf install is done!"
