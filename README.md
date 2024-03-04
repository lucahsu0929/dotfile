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
Iterm左上角 > setting(或直接按cmd+.) > Profiles > Colors > Color Presets(左下角）> import..


5. 安裝 zsh
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

7. 安裝zsh plugin
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```
 
9. 修改.zshrc
修改完後打開iterm 會自動跑powerlevel10k的設定，根據喜好調整
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


10. Keyboard Repeat Rate
<img width="469" alt="Key repeat rate" src="https://github.com/Luca0929/vim-config/assets/52985205/cc54b138-3cce-497c-a4b5-a77c8bb90178">

11. 配置neovim
```
mkdir ~/.config
git clone https://github.com/Luca0929/vim-config.git ~/.config/nvim
```

12. 安裝packer.nvim
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

13 Install Plugins
```
vim
:PackerSync
```
