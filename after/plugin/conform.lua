local conform = require('conform');
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    ['typescript'] = { "prettierd", "prettier", stop_after_first = true },
    ['angular.html'] = { "prettierd", "prettier", stop_after_firsty = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    sccs = { "prettierd", "prettier", stop_after_first = true },
  },
});


conform.formatters.prettier = {
    ft_parsers = {
        ['javascript'] = 'javascript',
        ['typescript'] = 'typescript',
        ['angular.html'] = 'html',
    },
    ext_parsers = {
        ['angular.html'] = 'html',
    }
}
