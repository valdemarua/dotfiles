set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set noswapfile " no swapfiles

" set autochdir

" Enable per-project .vimrc configuration files
set exrc
" Disable unsafe commands in your project-specific .vimrc files
set secure

" Load zsh as shell with .zshrc
set shell=zsh

" show ruler on 81 column
set colorcolumn=81

" Cursor settings
set cursorline " Highlight the current line

" Leader
let mapleader = " "
" Use \ as alternate leader
nmap \ <Leader>

call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine'
  " Plug 'isRuslan/vim-es6'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'keith/rspec.vim' " Better rspec syntax highlighting for Vim
  " Plug 'tpope/vim-bundler'
  " Plug 'tpope/vim-rake'
  Plug 'janko-m/vim-test'
  " Plug 'scrooloose/nerdcommenter'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  " Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion
  Plug 'tpope/vim-commentary'
  " projectionist.vim: Granular project configuration
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-eunuch'
  " surround.vim: quoting/parenthesizing made simple
  Plug 'tpope/vim-surround'
  " repeat.vim: enable repeating supported plugin maps with '.'
  Plug 'tpope/vim-repeat'
  " Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
  " MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
  " dash-case (cr-), dot.case (cr.), space case (cr<space>),
  " and Title Case (crt) are all just 3 keystrokes away.
  Plug 'tpope/vim-abolish'
  "
  " Color schemes
  "
  Plug 'chriskempson/base16-vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ayu-theme/ayu-vim' " ayu theme
  Plug 'mhartington/oceanic-next'
  Plug 'crusoexia/vim-monokai'
  " Solarized theme
  Plug 'lifepillar/vim-solarized8'
  " candid.vim
  Plug 'flrnd/candid.vim'
  " High Contrast & Vivid Color Scheme based on Monokai Pro
  Plug 'sainnhe/sonokai'
  " Elegant vim theme with bright colors.
  Plug 'connorholyday/vim-snazzy'
  " https://github.com/morhetz/gruvbox
  " Plug 'morhetz/gruvbox'
  Plug 'gruvbox-community/gruvbox'
  " Dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'altercation/vim-colors-solarized'
  " Deus was created out of sheer rage caused by all of the bad Solarized/Gruvbox clones.
  " Plug 'ajmwagar/vim-deus'

  Plug 'w0rp/ale'
  "
  " Vim snippets
  "
  " Track the engine.
  Plug 'SirVer/ultisnips'
  " I don't want javascript snippets from vim-snippets package
  Plug 'honza/vim-snippets', { 'do': 'rm -rf UltiSnips/javascript*.snippets' }
  " Useful snippets for developing in React (Javascript and Typescript)
  Plug 'mlaursen/vim-react-snippets'

  " Insert or delete brackets, parens, quotes in pair.
  Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }

  " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  " Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  " match-up is a drop-in replacement for the vim plugin matchit.vim.
  Plug 'andymass/vim-matchup'

  " A custom text object for selecting ruby blocks.
  Plug 'nelstrom/vim-textobj-rubyblock'
  " Vim plugin: Create your own text objects
  Plug 'kana/vim-textobj-user'
  " Vim bundle for styled-components, diet-cola, emotion, experimental glamor/styled, and astroturf content in javascript files.
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Syntax for JavaScript libraries
  " Plug 'othree/javascript-libraries-syntax.vim'
  " JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
  " (!) `gf` command does not resolve js file paths without this plugin
  Plug 'pangloss/vim-javascript'

  Plug 'leafgarland/typescript-vim'
  " 💯The most accurate syntax highlighting plugin for JavaScript and Flow.js
  " Plug 'yuezk/vim-js'
  " 🔦 [Vim script] JSX and TSX syntax pretty highlighting for vim.
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'yaegassy/coc-tailwindcss3', {'do': 'yarn install --frozen-lockfile'}
  " Cutting-edge vim css syntax file
  " https://github.com/JulesWang/css.vim
  Plug 'JulesWang/css.vim'
  Plug 'mattn/emmet-vim'
  " A Vim alignment plugin
  Plug 'junegunn/vim-easy-align'
  " A vim script to provide CamelCase motion through words (fork of inkarkat's camelcasemotion script)
  Plug 'bkad/camelcasemotion'
  " fugitive.vim: A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'
  " allows you to toggle bool (true/false) and other words with a shortcut
  " Plug 'vim-scripts/Toggle'
  Plug 'lukelbd/vim-toggle'
  " Toggles between hybrid and absolute line numbers automatically
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  "Plug '/usr/local/opt/fzf'
  " If you want to set up fzf globally on your system only using vim-plug, you can write Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " EasyMotion provides a much simpler way to use some motions in vim. It takes the <number> out of <number>w or <number>f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target.
  Plug 'easymotion/vim-easymotion'

  " Preview colours in source code while editing
  Plug 'ap/vim-css-color'

  Plug 'liuchengxu/vim-which-key'

  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'yaml', 'html'] }

  " This plugin causes all trailing whitespace characters (see Supported Whitespace Characters below) to be highlighted.
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'voldikss/vim-floaterm'

  " Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }

  " Easy navigation between JavaScript alternate files (source and test). Inspired by the amazing vim-rails.
  Plug 'dunckr/js_alternate.vim'

  "Go development plugin for Vim
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Far.vim makes it easier to find and replace text through multiple files. It's inspired by fancy IDEs, like IntelliJ and Eclipse, that provide cozy tools for such tasks.
  Plug 'brooth/far.vim'
  Plug 'freitass/todo.txt-vim'
  Plug 'mbbill/undotree'
  Plug 'wakatime/vim-wakatime'
call plug#end()

" Want utf8 at all times
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set ruler                      " Always show current position
set cmdheight=1                " Height of the command bar
set laststatus=2               " Always show the status line

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Lovely linenumbers
set nu

":set relativenumber
":set norelativenumber  " turn relative line numbers off
":set relativenumber!   " toggle relative line numbers
:set number relativenumber

set hlsearch    " Searching highlight
set incsearch   " Inceremental search
set ignorecase  " Ignore case
set smartcase

" For backspace
set backspace=indent,eol,start

" NERDTree options
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1 " Does not show Press ? for help
map <C-f><C-f> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$']

"map ff :CommandT<CR>
"nmap <C-p> :CommandT<CR>
" Files is a FZF Files command
"nmap <C-p> :FZF<CR>
"nmap <C-p>:call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
" noremap <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
nmap <Leader>p :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

if (has("termguicolors"))
  set termguicolors
endif

" let g:monokai_term_italic = 1
" let g:monokai_gui_italic = 1
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1

let g:airline_theme='gruvbox'
let g:airline_skip_empty_sections = 1

let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
" Set color background for errors and warningns
let g:gruvbox_guisp_fallback = "bg"
" Inverts selected text.
let g:gruvbox_invert_selection = 0
" Neodark theme: If you want to change background, set the 6 digit color code:
"colorscheme neodark
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
set background=dark
" colorscheme OceanicNext
colorscheme gruvbox

 " fix gruvbox's highlight for Ale
" highlight ALEInfo ctermfg=109 cterm=italic
" highlight ALEWarning ctermfg=214 cterm=italic
" highlight ALEError ctermfg=167 cterm=italic

"let g:neodark#background = '#202020'
"let g:neodark#use_256color = 1 " default: 0
"let g:neodark#terminal_transparent = 1 " default: 0
"let g:neodark#solid_vertsplit = 1 " default: 0

"
" vim-test
"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"let test#javascript#jest#executable = 'npm run test'
let test#javascript#jest#executable = 'NPM_TOKEN=bla yarn jest'
" let test#strategy = "vimterminal"
" let g:test#javascript#jest#file_pattern = '\v\.test\.js$'
" let g:test#javascript#jest#file_pattern = '\v(spec|test))\.(js|jsx|coffee|ts|tsx)$'


" ALE settings
"
" let g:ale_fixers = ['reek', 'scss_lint', 'eslint']
" Fix files with prettier, and then ESLint.
"
" Make it more beautiful later
if !empty(glob(".standard.yml"))
  let g:ale_fixers = ['standardrb', 'reek', 'scss_lint', 'eslint']
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'ruby': ['standardrb', 'reek'],
  \   'css': ['scss_lint'],
  \}
else
  let g:ale_fixers = ['rubocop', 'reek', 'scss_lint', 'eslint']
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'ruby': ['rubocop', 'reek'],
  \   'css': ['scss_lint'],
  \}
end
" let g:ale_fixers = ['standardrb', 'rubocop', 'reek', 'scss_lint', 'eslint']

" Only run linters named in ale_linters settings.


let g:ale_linters_explicit = 1

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>af :ALEFix<cr>
"
" end of ALE settings

"if !empty(glob("docker-compose.yml"))
"  let test#ruby#rspec#executable = 'docker exec -it spring spring rspec'
"end

" EasyAlign plugin settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" UltiSnips directories
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Activate repeat plugin
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" better-whitespace plugin settings
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_max_file_size=600
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0

"
" FZF for Vim
"
" This is the default extra key bindings
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-x': 'split',
  "\ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
"let g:fzf_layout = { 'down': '~35%' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)

"
" Coc Keybindings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Leader mappings
noremap <Leader>h :History<CR>
" Toggle conceal mode
nmap <Leader>cl :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
nmap <Leader>so :source ~/.vimrc<CR>
nmap <Leader>rc :vs ~/.vimrc<CR>
nnoremap <Leader>r :Rg<Space>
nnoremap <Leader>rr :execute ':Rg ' . expand('<cword>')<CR>
nnoremap <Leader>ss :execute '/' . expand('<cword>')<CR>

"
" Buffers and windows
"
" Close buffer
" nnoremap <nowait><leader>q :bw<Enter>

" Fugitive mappings
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gs :Git status<CR>

"
" Editing
"
" Insert a space in normal mode
"nnoremap <space> i<space><esc>
nnoremap ss i<space><esc>
" Delete surrounding whitespace
nnoremap <leader>dd F<space>xf<space>x
nmap <CR> o<Esc>

" IntentLine plugin
let g:indentLine_fileTypeExclude = ['json']

" projectionist settings
"
" let g:projectionist_heuristics = {
"       \   "*.js": {
"       \     "alternate": ["{dirname}/{basename}.test.js"],
"       \     "type": "source"
"       \   },
"       \   "*.test.js": {
"       \     "alternate": ["{dirname}/{basename}.js"],
"       \     "type": "test"
"       \   },
"       \
"       \   "etc/rbenv.d/|bin/rbenv-*": {
"       \     "bin/rbenv-*": {
"       \        "type": "command",
"       \        "template": ["#!/usr/bin/env bash"],
"       \     },
"       \     "etc/rbenv.d/*.bash": {"type": "hook"}
"       \   }
"       \ }

let g:coc_global_extensions = [
      \'coc-marketplace',
      \'coc-tsserver',
      \'coc-vimlsp',
      \'coc-solargraph',
      \'coc-json',
      \'coc-git',
      \'coc-css',
      \'coc-react-refactor',
      \]

"
" vim-toggle settings
"
let g:toggle_map = '+'
let g:toggle_words_on  = ["true", "on", "yes", "define", "in", "up", "left", "north", "east", "to", "if", "let"]
let g:toggle_words_off = ["false", "off", "no", "undef", "out", "down", "right", "south", "west", "not_to", "unless", "const"]
