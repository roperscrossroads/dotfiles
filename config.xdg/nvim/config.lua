return {
  theme = {
    name = "tokyonight",
    tokyonight = {
      variant = "moon",
    },
  },

  lsp_servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "gopls",
    "helm_ls",
    "ltex",
    "marksman",
    "nil_ls",
    "pyright",
    "lua_ls",
    "terraformls",
    "texlab",
    "tflint",
    "ts_ls",
    "tinymist",
    "yamlls",
  },

  plugins = {
    blink = {
      enabled = true,
    },
    chatgpt = {
      enable = false,
      opts = {
        api_key_cmd = "gopass show --password openai/api-token",
      },
    },
    copilot = {
      enable = false,
    },
    supermaven = {
      enabled = true,
    },
    emoji = {
      enabled = true,
      opts = {
        enable_cmp_integration = true,
        plugin_path = vim.fn.expand("$HOME/workspace/github.com/allaman/"),
      },
    },
    lf = {
      enable = false,
    },
    git = {
      merge_conflict_tool = "",
    },
    gopher = {
      enable = true,
    },
    gp = {
      enabled = false,
      opts = {
        openai_api_key = { "gopass", "show", "--password", "openai/api-token" },
        providers = {
          openai = {
            disable = false,
          },
          anthropic = {
            disable = false,
            endpoint = "https://api.anthropic.com/v1/messages",
            secret = {"bash", "-c", "cat $HOME/.secrets/anthropic-gp-nvm-token"},
          },
        },
      },
    },
    grug_far = {
      enabled = true,
    },
    harpoon = {
      enabled = false,
    },
    indent_blankline = {
      enable = true,
      enable_scope = false,
    },
    kustomize = {
      dev = true,
      opts = {
        enable_lua_snip = true,
        kinds = {
          show_filepath = true,
          show_line = true,
        },
        run = {
          trivy = {
            cmd = "trivy",
            args = { "-q", "fs" },
          },
          deprecations29 = {
            cmd = "kubent",
            args = { "-t", "1.29", "-c=false", "--helm3=false", "-l=error", "-e", "-f" },
          },
          deprecations30 = {
            cmd = "kubent",
            args = { "-t", "1.30", "-c=false", "--helm3=false", "-l=error", "-e", "-f" },
          },
        },
      },
    },
    lazy = {
      dev = {
        path = "~/dev/github.com/roperscrossroads/",
      },
      disabled_neovim_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
      lockfile = "~/.config/nvim/lazy-lock.json"
    },
    ltex = {
      additional_lang = "de-DE",
    },
    lualine = {
      extensions = { "fugitive", "fzf", "lazy", "neo-tree", "nvim-dap-ui", "quickfix", "symbols-outline", "toggleterm" },
      options = {},
    },
    markdown_preview = {
      enabled = true,
    },
    oil = {
      enabled = true,
    },
    overseer = {
      enable = true,
    },
    substitute = {
      enabled = true,
    },
    symbol_usage = {
      opts = {
        vt_position = "end_of_line",
        disable = { filetypes = {"dockerfile"} },
      },
    },
    telescope = {
      show_untracked_files = true,
      fzf_native = true,
    },
    todo_comments = {
      enabled = true,
    },
    trouble = {
      enabled = true,
    },
    zenmode = {
      enable = true,
    },
    yazi = {
      enabled = true,
    },
  }
}
