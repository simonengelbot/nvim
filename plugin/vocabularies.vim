function! SearchVocabularies()
  let word = system("pbpaste")
  execute ":edit!"
  " execute "vsplit vocabularies.txt"
  execute "/^" . word . "_\\|^" . word . " \\c"
endfunction

" nnoremap <silent> <C-b><C-b> :silent! call SearchVocabularies()<CR>
nnoremap <silent> <C-b><C-b> :call SearchVocabularies()<CR>
