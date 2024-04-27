-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

-- Make sure colorschemes are loaded on VeryLazy (we want them to be
-- loaded for previews)
local function build_colorscheme_spec(colorschemes)
  return vim.tbl_map(function(colorscheme)
    local fqn = type(colorscheme) == "string" and colorscheme or colorscheme[1]
    local spec =
      vim.tbl_extend("force", { fqn, event = "VeryLazy" }, type(colorscheme) == "table" and colorscheme or {})
    return spec
  end, colorschemes)
end

local colorschemes = {
	-- Clean and popular
	-- > A clean, dark Neovim theme written in Lua, with support for
	-- > lsp, treesitter and lots of plugins.
	"folke/tokyonight.nvim",

	-- One of my favorites
	-- > A dark and light Neovim theme written in fennel, inspired by IBM Carbon.
	"nyoom-engineering/oxocarbon.nvim",

	-- Really cool
	-- > A dark charcoal theme for modern Neovim & classic Vim
	"bluz71/vim-moonfly-colors",
	"bluz71/vim-nightfly-colors",
	"Everblush/nvim",
	"JoosepAlviste/palenightfall.nvim",
	"yonlu/omni.vim",
	"Abstract-IDE/Abstract-cs",
	"Mofiqul/dracula.nvim",
	"LunarVim/horizon.nvim",

	-- > Port of the original
	-- >> A Synthwave inspired colour theme (for VSCode)
	-- >> Source: https://github.com/robb0wen/synthwave-vscode
	"LunarVim/synthwave84.nvim",
	"katawful/kat.nvim",
	"hachy/eva01.vim",
	"igorgue/danger",

	-- > NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
	"rebelot/kanagawa.nvim",

	-- > Moonbow is a theme for nvim inspired by Gruvbox and Ayu dark
	"arturgoms/moonbow.nvim",

	-- > 🪨 A collection of contrast-based Vim/Neovim colorschemes
	{ "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },

	-- > 🍨 Soothing pastel theme for (Neo)vim
	{ "catppuccin/nvim", name = "catppuccin" },

	-- > All natural pine, faux fur and a bit of soho vibes for the classy minimalist
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "ellisonleao/gruvbox.nvim", opts = { palette_overrides = {} } },

	{ "scysta/pink-panic.nvim", dependencies = "rktjmp/lush.nvim" },

	{
		"jesseleite/nvim-noirbuddy",
		dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
	},

	{
		"maxmx03/fluoromachine.nvim",
		-- Setting these also enables the colorscheme. Poor
		opts = {
		  glow = true,
		},
	},

	"decaycs/decay.nvim",
	"projekt0n/github-nvim-theme",
	-- Soothing green colorscheme, very nice!
	"ribru17/bamboo.nvim",
	-- > [WIP] The timeless colorscheme for neovim text editor.
	"projekt0n/caret.nvim",
	{
		"svermeulen/text-to-colorscheme",
		opts = {
			default_palette = "sakura-glasgow-darker",
			ai = {
				openai_api_key = os.getenv("OPENAI_API_KEY"),
				gpt_model = "gpt-3.5-turbo-0613",
			},
			hex_palettes = {
				{
					name = "sakura-glasgow",
					background_mode = "dark",
					background = "#0b0b0b",
					foreground = "#ffffff",
					accents = {
						"#ffb8ca",
						"#ffd9b8",
						"#fff0b8",
						"#d9ffb8",
						"#b8ffcd",
						"#b8fff0",
						"#b8d9ff",
					},
				},
				{
					name = "sakura-glasgow-darker",
					background_mode = "dark",
					background = "#120f0f",
					foreground = "#e2b5b5",
					accents = {
						"#e2cc76",
						"#e2a876",
						"#76e296",
						"#a8e276",
						"#76e2cc",
						"#76a8e2",
						"#e27691",
					},
				},
			},
		},
	},
	"zootedb0t/citruszest.nvim",
	-- A take on monokai, but more consistent with the sublime text version
	"ofirgall/ofirkai.nvim",
}

return {
	build_colorscheme_spec(colorschemes),

	-- Effortlessly sync the terminal background with Neovim.
	-- As a side effect, get effortless transparency across color schemes!
	{
		"typicode/bg.nvim",
		lazy = false,
		cond = function()
			return os.getenv("NVIM_COLORSYNC") ~= nil
		end,
	},

	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = { --[[ things you want to change go here]]
		},
	},

	{
		"stevearc/conform.nvim",
		config = function()
			function prettier_svelte_formatter()
				local plugin_path = vim.fn.resolve(
					vim.fn.stdpath("data") .. "/mason/packages/prettier/node_modules/prettier-plugin-svelte/plugin.js"
				)

				local formatter = require("conform.formatters.prettier")
				formatter.args = {
					"--plugin",
					plugin_path,
					"--stdin-filepath",
					"$FILENAME",
				}

				return formatter
			end

			require("conform").setup({
				lsp_fallback = true,

				formatters = {
					prettier_svelte = prettier_svelte_formatter(),
				},

				formatters_by_ft = {
					svelte = { "prettier_svelte" },
				},
			})
		end,
	},
	{
		"yassinebridi/vim-purpura",
		priority = 1000,
		-- enabled = false,
		config = function()
			vim.cmd([[
        set background=dark
        set termguicolors
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        colorscheme purpura
      ]])
		end,
	},

	{ "LazyVim/LazyVim", opts = { colorscheme = "purpura" } },

	{ "evanleck/vim-svelte" },

	-- change trouble config
	-- {
	--   "folke/trouble.nvim",
	--   -- opts will be merged with the parent spec
	--   opts = { use_diagnostic_signs = true },
	-- },
	--
	-- -- disable trouble
	-- { "folke/trouble.nvim", enabled = false },
	--
	-- -- override nvim-cmp and add cmp-emoji
	-- {
	--   "hrsh7th/nvim-cmp",
	--   dependencies = { "hrsh7th/cmp-emoji" },
	--   ---@param opts cmp.ConfigSchema
	--   opts = function(_, opts)
	--     table.insert(opts.sources, { name = "emoji" })
	--   end,
	-- },
	--
	-- -- change some telescope options and a keymap to browse plugin files
	-- {
	--   "nvim-telescope/telescope.nvim",
	--   keys = {
	--     -- add a keymap to browse plugin files
	--     -- stylua: ignore
	--     {
	--       "<leader>fp",
	--       function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
	--       desc = "Find Plugin File",
	--     },
	--   },
	--   -- change some options
	--   opts = {
	--     defaults = {
	--       layout_strategy = "horizontal",
	--       layout_config = { prompt_position = "top" },
	--       sorting_strategy = "ascending",
	--       winblend = 0,
	--     },
	--   },
	-- },
	--

	-- -- add pyright to lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").svelte.setup({
				on_attach = function(client, bufnr)
					-- Your on_attach function here
					if client.name == "svelte" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							group = svelte_augroup,
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end
				end,
			})
		end,

		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				svelte = {
					capabilities = {
						workspace = {
							didChangeWatchedFiles = {
								dynamicRegistration = true,
							},
						},
					},
				},
			},
		},
	},
	-- -- add tsserver and setup with typescript.nvim instead of lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
			init = function()
				require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
					vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
				end)
			end,
		},
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- tsserver will be automatically installed with mason and loaded with lspconfig
				tsserver = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require("typescript").setup({ server = opts })
					return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
	},
	--
	-- -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
	-- -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	--
	-- -- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},
	--
	-- -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
	-- -- would overwrite `ensure_installed` with the new value.
	-- -- If you'd rather extend the default config, use the code below instead:
	-- {
	--   "nvim-treesitter/nvim-treesitter",
	--   opts = function(_, opts)
	--     -- add tsx and treesitter
	--     vim.list_extend(opts.ensure_installed, {
	--       "tsx",
	--       "typescript",
	--     })
	--   end,
	-- },
	--
	-- -- the opts function can also be used to change the default opts:
	-- {
	--   "nvim-lualine/lualine.nvim",
	--   event = "VeryLazy",
	--   opts = function(_, opts)
	--     table.insert(opts.sections.lualine_x, "ð")
	--   end,
	-- },
	--
	-- -- or you can return new options to override all the defaults
	-- {
	--   "nvim-lualine/lualine.nvim",
	--   event = "VeryLazy",
	--   opts = function()
	--     return {
	--       --[[add your custom lualine config here]]
	--     }
	--   end,
	-- },
	--
	-- -- use mini.starter instead of alpha
	-- { import = "lazyvim.plugins.extras.ui.mini-starter" },
	--
	-- -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
	-- { import = "lazyvim.plugins.extras.lang.json" },
	--
	-- -- add any tools you want to have installed below
	-- {
	--   "williamboman/mason.nvim",
	--   opts = {
	--     ensure_installed = {
	--       "stylua",
	--       "shellcheck",
	--       "shfmt",
	--       "flake8",
	--     },
	--   },
	-- },
	--
	-- -- Use <tab> for completion and snippets (supertab)
	-- -- first: disable default <tab> and <s-tab> behavior in LuaSnip
	-- {
	--   "L3MON4D3/LuaSnip",
	--   keys = function()
	--     return {}
	--   end,
	-- },
	-- -- then: setup supertab in cmp
	-- {
	--   "hrsh7th/nvim-cmp",
	--   dependencies = {
	--     "hrsh7th/cmp-emoji",
	--   },
	--   ---@param opts cmp.ConfigSchema
	--   opts = function(_, opts)
	--     local has_words_before = function()
	--       unpack = unpack or table.unpack
	--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	--     end
	--
	--     local luasnip = require("luasnip")
	--     local cmp = require("cmp")
	--
	--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
	--       ["<Tab>"] = cmp.mapping(function(fallback)
	--         if cmp.visible() then
	--           cmp.select_next_item()
	--           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
	--           -- this way you will only jump inside the snippet region
	--         elseif luasnip.expand_or_jumpable() then
	--           luasnip.expand_or_jump()
	--         elseif has_words_before() then
	--           cmp.complete()
	--         else
	--           fallback()
	--         end
	--       end, { "i", "s" }),
	--       ["<S-Tab>"] = cmp.mapping(function(fallback)
	--         if cmp.visible() then
	--           cmp.select_prev_item()
	--         elseif luasnip.jumpable(-1) then
	--           luasnip.jump(-1)
	--         else
	--           fallback()
	--         end
	--       end, { "i", "s" }),
	--     })
	--   end,
	-- },
}
