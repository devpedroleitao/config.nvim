local conform = require('conform');
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    ['typescript'] = { { "prettierd", "prettier" } },
    ['angular.html'] = { { "prettierd", "prettier" } },
    html = { "prettierd", "prettier" },
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

