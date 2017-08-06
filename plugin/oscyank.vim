if exists("g:loaded_oscyank")
  finish
endif
let g:loaded_oscyank = 1

let s:save_cpo = &cpo
set cpo&vim

command! Oscyank call oscyank#Oscyank()

let &cpo = s:save_cpo
unlet s:save_cpo
