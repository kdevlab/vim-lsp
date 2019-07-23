function! s:conceal_codeblocks() abort
    for l:type in g:markdown_fenced_languages
        let l:vim_type = substitute(matchstr(l:type, '[^=]*$'), '\..*', '', '')
        let l:markdown_type = matchstr(l:type, '[^=]*')

        execute printf('syntax region markdownHighlight%s matchgroup=markdownCodeDelimiter start="^{{{code\.begin\.%s}}}" end="{{{code\.end\.%s}}}$" keepend contains=@markdownHighlight%s concealends', l:vim_type, l:markdown_type, l:markdown_type, l:vim_type)
    endfor
endfunction

if has('conceal')
    call s:conceal_codeblocks()
endif
