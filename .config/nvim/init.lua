
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour 
vim.opt.termguicolors = true
vim.cmd([[
  set nocompatible              " be iMproved, required
  filetype off                  " required
  

  call plug#begin()

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
" For snippy users.
  Plug 'dcampos/nvim-snippy'
  Plug 'dcampos/cmp-snippy'

  Plug 'junegunn/vim-easy-align'

  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'mxsdev/nvim-dap-vscode-js'
  Plug 'Joakker/lua-json5', {'do':'./install.sh'}

  Plug 'dense-analysis/ale'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'stephpy/vim-yaml'
  Plug 'editorconfig/editorconfig-vim'
  " Plug 'Yggdroot/indentLine'

  Plug 'AbdelrahmanDwedar/awesome-nvim-colorschemes'

  Plug 'tsandall/vim-rego'
  Plug 'mattn/emmet-vim'
  
  " Thfollowing are examples of different formats supported.
  " Ke Plugin commands between vundle#begin/end.
  Plug 'tpope/vim-fugitive'
  " Plug 'L9'
  Plug 'vim-scripts/restore_view.vim'
  " Thsparkup vim script is in a subdirectory of this repo called vim.
  " Pa the path to set the runtimepath properly.
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'tree-sitter-grammars/tree-sitter-markdown', {'do': ':TSUpdate'} 

  Plug 'nvim-orgmode/orgmode'

  Plug 'akinsho/org-bullets.nvim'

  Plug 'github/copilot.vim'
  Plug 'EdenEast/nightfox.nvim' " Vim-Plug
  
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

  " Plug 'pedrohdz/vim-yaml-folds'
  " Plug 'embear/vim-foldsearch'
  call plug#end()

  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on

  ".vimrc
  "map <c-f> :call JsBeautify()<cr>
  " or
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for json
  autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
  " for jsx
  autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
  
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = 'editorconfig'
  
  au BufRead,BufNewFile Jenkinsfile setfiletype groovy
  
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  let g:ale_lint_on_text_changed = 'never'
  
  set foldlevelstart=20

  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable                     " Disable folding at startup.
  
  set clipboard=unnamedplus
  set nowrap
  set number
  set background=dark
  imap jj <ESC>
  
  set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
  let mapleader = "," " map leader to comma

  imap dto <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
]])

require('telescope-bindings')
require('nvim-dap-config')



vim.keymap.set("n", "<leader>dt", 'i<C-R>=strftime("%Y-%m-%d")<CR><Esc>', {noremap = true})
vim.keymap.set("n", "<leader>odt", 'i<C-R>=strftime("<%Y-%m-%d>")<CR><Esc>', {noremap = true})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
vim.keymap.set('n', '<leader>f', ':NvimTreeFocus<cr>', {noremap = true})

-- Load custom treesitter grammar for org filetype
-- require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  -- ensure_installed = {'org'}, -- Or run :TSUpdate org
}

local org = require('orgmode')

-- org.setup_ts_grammar();
org.setup({
  org_agenda_files = {'~/org/**/*'},
  org_default_notes_file = '~/org/todo.org',
  --org_todo_keywords = {'TODO(t)', 'WIP(w)', '|', 'DONE(d)'},
  org_todo_keywords = {'TODO', 'WIP', '|', 'DONE'},
  org_tags_column = 80,

  org_capture_templates = {
    r = {
        description = "Repo",
        template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
        target = "~/org/repos.org",
    },
    e = {
      description = 'Event',
      subtemplates = {
        r = {
          description = 'recurring',
          template = '** %?\n %T',
          target = '~/org/calendar.org',
          headline = 'recurring'
        },
        o = {
          description = 'one-time',
          template = '** %?\n %T',
          target = '~/org/calendar.org',
          headline = 'one-time'
        },
      },
    },
    J = {
      description = 'Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '~/org/journal/%<%Y-%m>.org'
    },
    T = {
      description = 'Todo',
      template = '* TODO %?\n %u',
      target = '~/org/todo.org'
    }
  }
})

require('org-bullets').setup()

require('gruvbox').load()

require('cmp').setup({
  sources = {
    { name = 'orgmode' }
  }
})
