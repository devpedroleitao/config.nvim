-- -- Define a function to run Jenkinsfile validation
-- local function validate_jenkinsfile()
--     require("jenkinsfile_linter").validate()
-- end

-- -- Create or ensure the autocommands exist in a group to manage them together
-- local augroup = vim.api.nvim_create_augroup("JenkinsfileLinterGroup", { clear = true })

-- -- Register autocommands for file open and insert leave events
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
--     group = augroup,
--     pattern = "*Jenkinsfile",    -- This pattern matches files named exactly "Jenkinsfile"
--     callback = validate_jenkinsfile,
-- })

