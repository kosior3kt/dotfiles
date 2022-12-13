
:set number
:syntax on
:set cursorline
:set autoindent


:set expandtab shiftwidth=4 softtabstop=4

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'



call plug#begin('/Users/jk/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'bignimbus/pop-punk.vim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'

call plug#end()

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort let col = col('.') - 1 return !col ||
    getline('.')[col - 1]  =~# '\s' endfunction

"making this thing usable
noremap ; l noremap l k noremap k j noremap j h


inoremap <silent><expr> <Tab> \ coc#pum#visible() ? coc#pum#next(1) : \
CheckBackspace() ? "\<Tab>" : \ coc#refresh()

" this is formatter formatting i guess:w
nnoremap <silent> <leader>f :Format<CR> nnoremap <silent> <leader>F
:FormatWrite<CR>


"even fancier formatter ???
autocmd BufNewFile,BufRead *.cpp set formatprg=/Users/jk/Programming/programs/astyle/as-gcc-exe/astyle\ -xg\ -xe\ -A4\ -xV\ -S\ -L\ -L\ -xf\ -xb\ -f 
autocmd BufNewFile,BufRead *.c set formatprg=/Users/jk/Programming/programs/astyle/as-gcc-exe/astyle\ -xg\ -xe\ -A4\ -xV\ -S\ -L\ -L\ -xf\ -xb\ -f



let g:gruvbox_underline=1 let g:gruvbox_transparent_bg = 1 let
g:gruvbox_undercurl=1 let g:gruvbox_bold=1 let g:gruvbox_italic=1 let
g:gruvbox_contrast_dark='hard' set termguicolors


"luafile ~/.config/nvim/lsp.lua luafile ~/.config/nvim/plugins.lua luafile
"~/.config/nvim/nvim-cmp.lua


set background=dark colo gruvbox

" pop-punk ANSI colors for vim terminal
"let g:terminal_ansi_colors = pop_punk#AnsiColors()

"let g:lightline.colorscheme = 'pop_punk'

hi! Normal ctermbg=NONE guibg=NONE hi! NonText ctermbg=NONE guibg=NONE


function! LinterStatus() abort let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error let
    l:all_non_errors = l:counts.total - l:all_errors return l:counts.total ==
    0 ? 'OK' : printf( \   '%d⨉ %d⚠ ', \   all_non_errors, \   all_errors \)
endfunction set statusline+=%= set statusline+=\ %{LinterStatus()}

"inoremap <c-b> <ESC>:NERDTreeToggle<cr> nnoremap <c-b>
"<ESC>:NERDTreeToggle<cr> nmap <c-b> :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeFocus<CR> nnoremap <C-n> :NERDTree<CR> nnoremap
<C-t> :NERDTreeToggle<CR> nnoremap <C-f> :NERDTreeFind<CR>

vmap ++ <plug>NERDCommenterToggle nmap ++ <plug>NERDCommenterToggle

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr> nnoremap <leader>fg
<cmd>Telescope live_grep<cr> nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
  if maparg('<C-L>', 'n') ==# '' nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif

  " Airline {
    if !exists('g:airline_symbols') let g:airline_symbols = {} endif

    let g:airline#extensions#tabline#enabled = 1 let
    g:airline#extensions#tabline#buffer_idx_mode = 1 let
    g:airline#extensions#tabline#fnamemod = ':t' let
    g:airline#extensions#tabline#left_sep = '' let
    g:airline#extensions#tabline#left_alt_sep = '' let
    g:airline#extensions#tabline#right_sep = '' let
    g:airline#extensions#tabline#right_alt_sep = '' let
    g:airline#extensions#tabline#formatter = 'default'

    " unicode symbols
    let g:airline_left_sep = '»' let g:airline_left_sep = '▶' let
    g:airline_right_sep = '«' let g:airline_right_sep = '◀' let
    g:airline_symbols.crypt = '🔒' let g:airline_symbols.linenr = '␊' let
    g:airline_symbols.linenr = '␤' let g:airline_symbols.linenr = '¶' let
    g:airline_symbols.maxlinenr = '☰' let g:airline_symbols.maxlinenr = '' let
    g:airline_symbols.branch = '⎇' let g:airline_symbols.paste = 'ρ' let
    g:airline_symbols.paste = 'Þ' let g:airline_symbols.paste = '∥' let
    g:airline_symbols.spell = 'Ꞩ' let g:airline_symbols.notexists = '∄' let
    g:airline_symbols.whitespace = 'Ξ'

    " Theme ( github.com/vim-airline/vim-airline-themes
    "let g:airline_theme= 'pop' let g:airline_theme = 'violet' 

" for the airline theme - note the underscore instead of the hyphen
    let g:airline_theme = 'pop_punk'
    " }

    "I have no fucking clue what's gonna heppaned here soon"
    
    " Set internal encoding of vim, not needed on neovim, since coc.nvim using
    " some unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number else set signcolumn=yes endif


function! s:check_back_space() abort let col = col('.') - 1 return !col ||
    getline('.')[col - 1]  =~# '\s' endfunction

" Use <c-space> to trigger completion.
if has('nvim') inoremap <silent><expr> <c-space> coc#refresh() else inoremap
    <silent><expr> <c-@> coc#refresh() endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() \:
"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics Use `:CocDiagnostics` to get all
" diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev) nmap <silent> ]g
<Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition) nmap <silent> gy
<Plug>(coc-type-definition) nmap <silent> gi <Plug>(coc-implementation) nmap
<silent> gr <Plug>(coc-references)

function! s:show_documentation() if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>') elseif (coc#rpc#ready()) call
    CocActionAsync('doHover') else execute '!' . &keywordprg . " " .
    expand('<cword>') endif endfunction


" Use K to show documentation in preview window.
nnoremap <silent> ££ :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected) nmap <leader>f
<Plug>(coc-format-selected)

augroup mygroup autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region. Example: `<leader>aap` for
" current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected) nmap <leader>a
<Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects NOTE: Requires
" 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i) omap if <Plug>(coc-funcobj-i) xmap af
<Plug>(coc-funcobj-a) omap af <Plug>(coc-funcobj-a) xmap ic
<Plug>(coc-classobj-i) omap ic <Plug>(coc-classobj-i) xmap ac
<Plug>(coc-classobj-a) omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750') nnoremap <silent><nowait><expr>
    <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>" nnoremap
    <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0)
    : "\<C-b>" inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
    "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>" inoremap
    "<silent><nowait><expr> <C-b> coc#float#has_scroll() ?
    ""\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>" vnoremap
    <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1)
    : "\<C-f>" vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
    coc#float#scroll(0) : "\<C-b>" endif

" Use CTRL-S for selections ranges. Requires 'textDocument/selectionRange'
" support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select) xmap <silent> <C-s>
<Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand',
'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support. NOTE: Please see `:h coc-status`
" for integrations with external plugins that provide custom statusline:
" lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
