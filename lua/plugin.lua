function _G.setup_monokai()
    local monokai = require('monokai')
    local palette = monokai.classic
    monokai.setup {
        palette = {
        },
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
