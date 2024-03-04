1. 安裝brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. 安裝iterm

```
brew install --cask iterm2
```

3. Iterm theme: Tomorrow Night Eighties

<https://github.com/chriskempson/tomorrow-theme/blob/master/iTerm2/Tomorrow%20Night%20Eighties.itermcolors>


4. 安裝 zsh
```
sudo apt install zsh
```

5. 安裝 oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

6. 安裝 zsh theme: powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

7. 修改.zshrc
```
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
```


8. 調整提示文字顏色
```
vim ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
```

9. 加入簡寫
```
vim ~/.oh-my-zsh/custom/alias.zsh
alias vim=‘nvim’ 
```


