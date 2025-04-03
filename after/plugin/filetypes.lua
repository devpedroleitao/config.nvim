vim.filetype.add({
    pattern = {
        [".*%.xml%.mustache"] = "xml", -- Sets the filetype to `xml` for special template files
        [".*%.Jenkinsfile"] = "groovy", -- Sets the filetype to `groovy` for Jenkinsfiles
        [".*%.jenkinsfile"] = "groovy",
    },
})
