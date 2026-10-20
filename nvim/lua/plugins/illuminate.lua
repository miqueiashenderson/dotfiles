-- vim-illuminate: realça todas as ocorrências da variável/símbolo sob o cursor
require("illuminate").configure({
    delay = 200,
    large_file_cutoff = 2000, -- desliga em arquivos grandes (performance)
    under_cursor = true,
})
