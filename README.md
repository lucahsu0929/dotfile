1. 安裝brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. 安裝iterm

```
brew install --cask iterm2
```

3. Iterm theme : Tomorrow Night Eighties
```
https://github.com/chriskempson/tomorrow-theme/blob/master/iTerm2/Tomorrow%20Night%20Eighties.itermcolors
```

安裝 zsh
sudo apt install zsh


安裝 oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


安裝 zsh theme: powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

安裝好後要修改 zsh 設定檔 .zshrc，先把主題換成剛剛安裝的 powerlevel10k。

vim ~/.zshrc

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git 
  zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	z
	vi-mode
)


調整提示文字顏色：
到下列位置修改
~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
調整顯示顏色：ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

~/.oh-my-zsh/custom/alias.zsh

alias v=‘nvim’ 



