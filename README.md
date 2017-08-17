oscyank.vim
==============

Clipboard integration by Operating System Controls from Vim

* Clip selected text.
* Clip text in the register.
* Support multibyte characters.

Installation
=============

For [dein.vim](https://github.com/Shougo/dein.vim).

```vim
call dein#add('greymd/oscyank.vim')
```

Usage
=============

### `:Oscyank`
* Step1: Select text.
* Step2: Type `:Oscyank` which displays `'<,'>Oscyank`.
* Step3: Selected text will be stored to your clipboard through OSC.

### `:OscyankRegister`
* Step1: Yank text.
* Step2: Contents in the register is stored to your clipboard through OSC by executing `:OscyankRegister` .

Other features
==============

This plugin supports not only normal terminal but also following terminal multiplexers.

* [tmux](https://github.com/tmux/tmux/wiki)
* screen

FYI: Author's usage
=============

```vim
" set spece key as a Leader
let mapleader = "\<Space>"
noremap <leader>y :Oscyank<cr>
```

Select something and type `<space> + y`.

License
==============
MIT
