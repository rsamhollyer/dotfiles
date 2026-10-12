local map = vim.keymap.set

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
})

-- LSP keymaps, set when a server attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function m(keys, fn, desc)
      map("n", keys, fn, { buffer = ev.buf, desc = desc })
    end
    m("gd", vim.lsp.buf.definition, "Go to definition")
    m("gD", vim.lsp.buf.declaration, "Go to declaration")
    m("gi", vim.lsp.buf.implementation, "Go to implementation")
    m("K", vim.lsp.buf.hover, "Hover")
    m("<leader>rn", vim.lsp.buf.rename, "Rename")
    m("<leader>ca", vim.lsp.buf.code_action, "Code action")
    m("<leader>f", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end, "Format")
  end,
})
