if exists("g:loaded_oscyank")
  finish
endif
let g:loaded_oscyank = 1

let s:save_cpo = &cpo
set cpo&vim

command! -range Oscyank call oscyank#Oscyank()
command! OscyankRegister call oscyank#OscyankRegister()

let &cpo = s:save_cpo
unlet s:save_cpo
