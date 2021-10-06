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
            }
        }
    }
end
