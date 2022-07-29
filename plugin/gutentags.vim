let g:gutentags_enabled = 1

let g:gutentags_exclude_filetypes = ["rust"]
au FileType rust :silent !rusty-tags -n 8 vi
