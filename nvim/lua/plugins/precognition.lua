-- precognition: mostra em virtual text as teclas de movimento úteis na linha
-- (w, b, e, ^, $, %...) — didático e visual. Toggle: :Precognition toggle
require("precognition").setup({
    startVisible = true,
    showBlankVirtLine = false, -- não desenha linha virtual vazia
    -- o f nativo do vim foi substituído pelo hop (lua/plugins/hop.lua),
    -- então as dicas de f/F nativas só confundiriam
    targetedMotionHints = { enabled = false },
    disabled_fts = { "help", "alpha", "dashboard", "NvimTree", "checkhealth", "mason" },
})
