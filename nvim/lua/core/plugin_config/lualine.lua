require("lualine").setup({
	options = {
		icons_enables = true,
		theme = "palenight",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_c = {
			{
				"require'sf.org'.get_target_org()",
				color = function(section)
					local current_org = require("sf.org").get_target_org()
					if string.find(current_org, "PROD") then
						return {
							bg = "#ff0000",
							gui = "bold",
						}
					end
					return nil
				end,
				icon = "󰢎",
			},
		},
		lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
		lualine_z = { "location", "mode" },
	},
})
