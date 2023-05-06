function! ToggleLineNumber()
  if &number == 1 && &relativenumber == 1
    set nonumber
    set norelativenumber
  elseif &number == 1 && &relativenumber == 0
    set nonumber
    set relativenumber
  elseif &number == 0 && &relativenumber == 1
    set number
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction

nnoremap <silent> <C-l><C-l> :call ToggleLineNumber()<CR>
