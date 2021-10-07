let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_invert_signs = 1
function! GruvboxUpdateColors()
    hi! link Function GruvboxAqua
    hi! link TSOperator GruvboxRed
    hi! link TSKeywordOperator GruvboxRed
    hi! link TSKeywordFunction GruvboxRed
    hi! link TSParameter GruvboxOrange
endfunction
autocmd ColorScheme gruvbox call GruvboxUpdateColors()
