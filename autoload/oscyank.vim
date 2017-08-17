let s:save_cpo = &cpo
set cpo&vim

function! s:OscyankPut(text)
  let encodedText=""
  if $TMUX != ""
    let encodedText=substitute(a:text, '\', '\\', "g")
  else
    let encodedText=substitute(a:text, '\', '\\\\', "g")
  endif
  let encodedText=substitute(encodedText, "\'", "'\\\\''", "g")
  let executeCmd="echo -n '".encodedText."' | base64 | tr -d '\\n'"
  let encodedText=system(executeCmd)
  if $TMUX != ""
    " tmux
    let executeCmd='echo -en "\033Ptmux;\033\033]52;;'.encodedText.'\033\033\\\\\033\\" > /dev/tty'
  elseif $TERM == "screen"
    " screen
    let executeCmd='echo -en "\033P\033]52;;'.encodedText.'\007\033\\" > /dev/tty'
  else
    let executeCmd='echo -en "\033]52;;'.encodedText.'\033\\" > /dev/tty'
  endif
  call system(executeCmd)
  redraw!
endfunction

" Yank register's content with OSC.
function! oscyank#OscyankRegister()
  " Put current register's content to 'text'
  let text = @"
  " Put text with OSC52
  call s:OscyankPut(text)
endfunction

" Yank selected content with OSC.
function! oscyank#Oscyank() range
  " Backup register.
  let tmp = @@
  " Yank current selected line.
  silent normal gvy
  " Put current register's content to 'text'
  let text = @@
  " Restore original register.
  let @@ = tmp
  " Put text with OSC52
  call s:OscyankPut(text)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
