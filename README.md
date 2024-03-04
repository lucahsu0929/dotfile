## Custom Key-mappings


* **Leader** 設為 <kbd>Space</kbd>

<details open>
  <summary>
    <strong>Key-mappings</strong>
    <small><i>(🔎 Click to expand/collapse)</i></small>
  </summary>

<center>模式: 𝐍=普通模式 𝐕=可視模式(選取) 𝐈=插入模式</center>

### 常用按鍵 

| Key   | Mode | Action             | 說明 
| ----- |:----:| ------------------ | ------
| <kbd>jk</kbd>| 𝐈| 切換到普通模式 | 
| <kbd>Space</kbd> + <kbd>.</kbd>| 𝐍 | 打開/關閉 Terminal | 
| <kbd>Space</kbd>+<kbd>r</kbd>| 𝐍 𝐕 𝐈| Jump to edge upward/downward | <small>[haya14busa/vim-edgemotion]</small>
| <kbd>gh</kbd> / <kbd>gl</kbd> | 𝐍 𝐕 | Easier line-wise movement | `g` `^/$`
| <kbd>Space</kbd>+<kbd>Space</kbd> | 𝐍 𝐕 | Toggle visual-line mode | `V` / <kbd>Escape</kbd>
| <kbd>v</kbd> / <kbd>V</kbd> | 𝐕 | Expand/reduce selection | <small>[terryma/vim-expand-region]</small>
| <kbd>zl</kbd> / <kbd>zh</kbd> | 𝐍 | Scroll horizontally and vertically wider | `z4` `l/h`
| <kbd>Ctrl</kbd>+<kbd>j</kbd> | 𝐍 | Move to split below | <small>[christoomey/tmux-navigator]</small>
| <kbd>Ctrl</kbd>+<kbd>k</kbd> | 𝐍 | Move to upper split | <small>[christoomey/tmux-navigator]</small>
| <kbd>Ctrl</kbd>+<kbd>h</kbd> | 𝐍 | Move to left split | <small>[christoomey/tmux-navigator]</small>
| <kbd>Ctrl</kbd>+<kbd>l</kbd> | 𝐍 | Move to right split | <small>[christoomey/tmux-navigator]</small>
| <kbd>Return</kbd> | 𝐍 | Toggle fold | `za`
| <kbd>Shift</kbd>+<kbd>Return</kbd> | 𝐍 | Focus the current fold by closing all others | `zMzvzt`
| <kbd>]q</kbd> or <kbd>]q</kbd> | 𝐍 | Next/previous on quickfix list | `:cnext` / `:cprev`
| <kbd>]l</kbd> or <kbd>]l</kbd> | 𝐍 | Next/previous on location-list | `:lnext` / `:lprev`
| <kbd>]w</kbd> or <kbd>]w</kbd> | 𝐍 | Next/previous whitespace error | <small>[plugin/whitespace.vim]</small>
| <kbd>]g</kbd> or <kbd>]g</kbd> | 𝐍 | Next/previous Git hunk | <small>[airblade/vim-gitgutter]</small>
| <kbd>]d</kbd> or <kbd>]d</kbd> | 𝐍 | Next/previous LSP diagnostic | <small>[mattn/vim-lsp-settings]</small>
| <kbd>Ctrl</kbd>+<kbd>f</kbd> | 𝐂 | Move cursor forwards in command | <kbd>Right</kbd>
| <kbd>Ctrl</kbd>+<kbd>b</kbd> | 𝐂 | Move cursor backwards in command | <kbd>Left</kbd>
| <kbd>Ctrl</kbd>+<kbd>h</kbd> | 𝐂 | Move cursor to the beginning in command | <kbd>Home</kbd>
| <kbd>Ctrl</kbd>+<kbd>l</kbd> | 𝐂 | Move cursor to the end in command | <kbd>End</kbd>

1. 安裝brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. 安裝iterm

```
brew install --cask iterm2
```

3. Iterm theme: Tomorrow Night Eighties  <br>
<https://github.com/chriskempson/tomorrow-theme/blob/master/iTerm2/Tomorrow%20Night%20Eighties.itermcolors> <br>
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
 
9. 修改.zshrc <br>
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
