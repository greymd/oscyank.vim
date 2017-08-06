oscyank.vim
==============

Clipboard integration by Operating System Controls from Vim

Installation
=============

For [dein.vim](https://github.com/Shougo/dein.vim).

```
call dein#add('greymd/oscyank.vim')
```

Usage
=============
Step1. Yank something.
Step2. `:Oscyank` and contents in the register will be applied to your clipboard.

Author's usage
=============

```
noremap <leader>y :Oscyank<cr>
```
