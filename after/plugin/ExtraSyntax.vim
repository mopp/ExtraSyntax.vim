"=============================================================================
" File: ExtraSyntax.vim
" Author: mopp
" Created: 2014-09-21
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_extrasyntax')
    finish
endif
let g:loaded_extrasyntax = 1

let s:save_cpo = &cpo
set cpo&vim



let g:extra_syntax_append_words = get(g:, 'extra_syntax_append_words', [ 'NOTE', 'XXX', 'FIXME', 'TODO', 'MEMO' ])
let g:extra_syntax_append_words_str = ''
for i in g:extra_syntax_append_words
    let g:extra_syntax_append_words_str = g:extra_syntax_append_words_str . ' ' . i
endfor


function! s:override_keyword()
    let ft = expand('<amatch>')
    let todo = ft . 'Todo'

    " exceptional name
    if ft == 'nasm'
        let todo = 'nasmInCommentTodo'
    endif
    execute 'syntax keyword' todo 'contained' g:extra_syntax_append_words_str
endfunction


augroup extrasyntax
    autocmd!
    autocmd Syntax * call s:override_keyword()
augroup END



let &cpo = s:save_cpo
unlet s:save_cpo
