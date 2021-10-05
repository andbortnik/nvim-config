let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_invert_signs = 1
function! GruvboxUpdateColors()
    hi! link Function GruvboxAqua
endfunction
autocmd ColorScheme gruvbox call GruvboxUpdateColors()
