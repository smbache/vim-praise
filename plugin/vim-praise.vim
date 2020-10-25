function! g:Praise()
  echom vimpraise#generate()
endfunction

command! PRAISE call g:Praise()

if exists('g:praise_event')
  if g:praise_event == 'BufEnter'
    autocmd BufEnter * PRAISE
  endif
else
  autocmd BufNew,VimEnter * PRAISE
endif
