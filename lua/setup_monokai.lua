function _G.setup_monokai(palette_name)
    local monokai = require('monokai')
    local palette = monokai[palette_name]
    monokai.setup {
        palette = palette,
        custom_hlgroups = {
            TSParameter = {
                fg = palette.orange,
            },
            TSParameterReference = {
                fg = palette.orange,
            },
            TSKeyword = {
                fg = palette.pink,
                style = 'italic',
            },
            TSKeywordFunction = {
                fg = palette.pink,
                style = 'italic',
            },
            TSKeywordOperator = {
                fg = palette.pink,
            },
            TSKeywordReturn = {
                fg = palette.pink,
            },
        }
    }
end
