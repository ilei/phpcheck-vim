ubuntu系统vim下phpcheck拆件
=============
 PHP 语法检查插件

参考了：[phpcheck.vim][1] 与 [vim-phpqa][2] .

## Usage:

```vim
" 用 Vundle.vim 安装插件
Plugin 'ilei/phpcheck-vim'

" 设置插件自动运行，即写入文件后触发 PHP 代码检查
let g:php_check_autorun = 1

" 设置 <F6> 为代码检查映射键
noremap <F6> :call CallPhpCheckSyntax()<CR>
inoremap <F6> <ESC>:call CallPhpCheckSyntax()<CR>
```

[1]:http://vim.sourceforge.net/scripts/script.php?script_id=4984
[2]:https://github.com/joonty/vim-phpqa
