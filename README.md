# Lumina's NeoVim Configuration

![IMG_2306](https://github.com/Luca0929/vim-config/assets/52985205/a06d01b6-6bc4-4096-b803-f26148f86e53)

## 配置特色
* 快速啟動 
* 輕量化
* 柔和配色
* lua配置
* 支援Java/C/Python運行
* 支援Markdown即時預覽
* 內建Terminal，不必再進進出出
* nvimtree側邊資料瀏覽
* 快速跳轉，大量減少鼠標依賴

##  安裝步驟
**_1._** 安裝brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**_2._** 安裝iterm



```
brew install --cask iterm2
```

**_3._** 修改Iterm主題
<br>Theme : [Tomorrow Night Eighties](https://github.com/chriskempson/tomorrow-theme/blob/master/iTerm2/Tomorrow%20Night%20Eighties.itermcolors)
<br>打開Iterm > <kbd>cmd</kbd>+<kbd>,</kbd> > Profiles > Colors > Color Presets(右下角）> import..


**_4._** 安裝 zsh
```
brew install openjdk
```

```
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

```
brew install zsh
```

**_5._** 安裝 oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

**_6._** 安裝 zsh theme: powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

**_7._** 安裝zsh plugin
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```
 
**_8._** 修改.zshrc <br>
```
vim ~/.zshrc
```

```
找到以下內容並修改
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
修改完後重新打開iterm 會自動跑powerlevel10k的設定，根據喜好調整


**_9._** 調整提示文字顏色
```
vim ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

```
找到以下內容並修改
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
```

**_10._** 加入簡寫

```
vim ~/.oh-my-zsh/custom/alias.zsh
```

```
alias vim=‘nvim’ 
//這裡vim可以改成任何想稱呼vim的名字
//例如 alias v = 'nvim'
```


**_11._** Keyboard Repeat Rate<br>
設定 > 鍵盤<br>
鍵盤重複速率(不然原本的vim移動太慢了)<br>
<img width="469" alt="Key repeat rate" src="https://github.com/Luca0929/vim-config/assets/52985205/cc54b138-3cce-497c-a4b5-a77c8bb90178">


**_12._** 安裝packer.nvim
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

**_13._** 配置neovim
```
mkdir ~/.config
git clone https://github.com/Luca0929/vim-config.git ~/.config/nvim
```

**_14._** 安裝插件
```
brew install node
```

```
brew install yarn
```

```
vim
:PackerSync
```
**_15._** 學習vim、練習打字速度

![The-learning-curve-With-the-introduction-and-implementation-of-a-new-technique-high](https://github.com/Luca0929/vim-config/assets/52985205/88003380-43ab-48cb-8ef5-51875a228c49)
<img width="50%" alt="Screenshot 2024-03-05 at 9 11 19 PM" src="https://github.com/Luca0929/vim-config/assets/52985205/be6fc97f-4370-4efd-bd0d-f1491a1e99cc"> <br>
<img width="50%" alt="Screenshot 2024-03-05 at 9 19 48 PM" src="https://github.com/Luca0929/vim-config/assets/52985205/42e2678b-c2b7-4ac8-a646-f4c0ded4b509"> <br>

[我學會盲打的地方，記得登入紀錄學習歷程](https://www.keybr.com/) <br>
[好看的打字練習](https://monkeytype.com/)


---

## 按鍵配置

<strong>Leader</strong> 設為 <kbd>Space</kbd> 

𝐍=普通模式、𝐕=可視模式(選取)、𝐈=插入模式

### vim基本操作
#### 1. 移動
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>hjkl</kbd>|𝐍 𝐕| 左下右上 | 
| <kbd>w</kbd>|𝐍 𝐕| 到下一個單字|<kbd>w b</kbd>基本上可以取代<kbd>h l</kbd><br>在一行中快速左右移動 
| <kbd>b</kbd>|𝐍 𝐕| 到上一個單字|建議學習使用，提升移動效率 
| <kbd>0</kbd>|𝐍 𝐕| 到行首| 
| <kbd>$</kbd>|𝐍 𝐕| 到行尾| 
| <kbd>A</kbd>|𝐍| 到行尾<br>且進入輸入模式| 使用頻率高
| <kbd>gg</kbd>|𝐍 𝐕| 到文件頂| 
| <kbd>G</kbd>|𝐍 𝐕| 到文件底| 

#### 2. 複製 
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>y</kbd>|𝐕| 複製圈選範圍 | 要用可視模式選範圍 
| <kbd>yy</kbd>|𝐍| 複製當前行 | 
| <kbd>8yy</kbd>|𝐍| 向下複製8行 | 簡單來說最前面加數字n可以往下重複執行n次<br>後續的刪除等等也適用，後續表格就不再重複寫

#### 3. 貼上
| 按鍵   | 模式 | 動作             |
| ----- |:------:| ------------------- |
| <kbd>p</kbd>|𝐍| 貼上 | 

#### 4. 剪下
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>x</kbd>|𝐍| 剪下一個字符 | 
| <kbd>xp</kbd>|𝐍| 交換兩個字符，如從bs變成sb| 單字拼錯時很好用<br>watre -> water<br>xp其實就是剪下再貼上

#### 5. 刪除 
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>dd</kbd>|𝐍| 刪除一行 |刪除的內容會放到剪貼板<br>按p即可貼到其他地方。 
| <kbd>dw</kbd>|𝐍| 刪除一個單字 |w就是word的意思 
| <kbd>ctrl</kbd> + <kbd>w</kbd>|𝐈| 刪除一個單字 | 在輸入模式直接刪除一個字<br>可以取代刪除鍵<br>實用 

#### 6. 替換、還原r+<待替換字母>：將游標所在字母替換為指定字母
| 按鍵   | 模式 | 動作             | 
| ----- |:------:| ------------------- |
| <kbd>r</kbd> + <kbd>[要替換的字]|𝐍| 替換一個字| 
| <kbd>cc</kbd>|𝐍|  刪除整行，並進入插入模式| 
| <kbd>cw</kbd>|𝐍|  刪除一個單詞，並進入插入模式| 
| <kbd>u</kbd>|𝐍|  回到上一步| 
| <kbd>ctrl</kbd> + <kbd> r </kbd> |𝐍|  回到下一步| 

#### 7. 搜索
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>/</kbd>|𝐍| 搜尋 | 在普通模式下<br>按下/直接進入查找<br>輸入相應的字符串按enter即可
| <kbd>n</kbd>|𝐍| 搜尋 | 尋找下一個匹配
| <kbd>N</kbd>|𝐍| 搜尋 | 尋找上一個匹配 


#### 8. 退出
| 按鍵   | 模式 | 動作             | |
| ----- |:------:| ------------------- |-| 
| <kbd>:q</kbd>|𝐍| 退出 | 如果沒保存會跳出警告
| <kbd>:wq</kbd>|𝐍| 保存&退出 | 
| <kbd>:q!</kbd>|𝐍| 強制退出(不保存) | 

### 自定義常用按鍵 
| 自定義按鍵   | 模式 | 動作             | 使用說明/來源
| ----- |:----:| ------------------ | ------
| <kbd>jk</kbd>| 𝐈| 切換到普通模式 | 
| <kbd>Space</kbd> + <kbd>j</kbd>| 𝐍 | 快速跳轉到任意單字 |hop.nvim 
| <kbd>ctrl</kbd> + <kbd>j</kbd>| 𝐍 | 快速往下移動 | 
| <kbd>ctrl</kbd> + <kbd>k</kbd>| 𝐍 | 快速往上移動 | 
| <kbd>Space</kbd> + <kbd>.</kbd>| 𝐍 | 打開/關閉 Terminal | floatterm.nvim
| <kbd>Space</kbd> + <kbd>r</kbd>| 𝐍 𝐕 𝐈| 編譯&執行 | 支援C/C++/Python/Java<br>asyncrun.nvim
| <kbd>tab</kbd> + <kbd>q</kbd>| 𝐍 | 關閉tab(buffer) | 
| <kbd>tab</kbd> + <kbd>j</kbd>| 𝐍 | 上一個tab(buffer) | 
| <kbd>tab</kbd> + <kbd>k</kbd>| 𝐍 | 下一個tab(buffer) | 
| <kbd>Space</kbd> + <kbd>w</kbd>| 𝐈| 保存文件 | 
| <kbd>Space</kbd> + <kbd>a</kbd> + <kbd>c</kbd>| 𝐕 | 複製整份文件 | 
| <kbd>Space</kbd> + <kbd>c</kbd>| 𝐕 | 複製選取文字 | 用可視模式選取
| <kbd>Space</kbd> + <kbd>f</kbd> + <kbd>f</kbd>| 𝐕 | 快速查找文件 |搜索文件所在資料夾內所有檔案 <br> telescope.nvim
| <kbd>Space</kbd> + <kbd>m</kbd>| 𝐍 | 打開MarkDown預覽 | markdown-preview.nvim


### nvimtree 操作（資料探索) 
| 按鍵   | 動作            | 注意事項|
| ----- |:----:| ----- |
| <kbd>Space</kbd> + <kbd>e</kbd> + <kbd>e</kbd>| 打開nvimtree |  |
| <kbd>Space</kbd> + <kbd>e</kbd> + <kbd>f</kbd>| 打開nvimtree並找到當前檔案 | |
| <kbd>o</kbd>| 打開/關閉文件 | |
| <kbd>a</kbd>| 創建新文件 | |
| <kbd>r</kbd>| 重新命名文件 || 
| <kbd>x</kbd>| 剪下文件 || 
| <kbd>c</kbd>| 複製文件 || 
| <kbd>p</kbd>| 貼上 剪下或複製的文件 || 
| <kbd>d</kbd>| 刪除文件 | 不推薦使用，刪除就找不回來 |


