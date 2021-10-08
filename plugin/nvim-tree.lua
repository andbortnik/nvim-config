require'nvim-tree'.setup {
    open_on_setup = false,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}
