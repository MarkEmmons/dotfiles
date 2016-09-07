"## Set tab length ##
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"# Enable mouse
set mouse=a

"# Show line numbers
set number

"# Allow wrapping
set whichwrap+=<,>,h,l,[,]

"## Found at https://www.reddit.com/r/vim/comments/y93r1/whats_the_latest_useful_thing_you_added_to_vimrc/
"# FireFly
set fillchars=vert:│    	" that's a vertical box-drawing character
cnoremap w!! w !sudo dd of=%	" superuser-write alias

"# josemota
nnoremap <leader>gs :Gstatus<CR><C-W>15+ "Open interactive git status and enlarge window by 15.
vnoremap < <gv "Indent back a selection and keep the selection. Similar for forward indents.
nnoremap <leader>w :w<CR> "save. Instead of pressing four keys (shift is included) I press two.

"# XQYZ
" Switch windows with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"# selkie
command! -complete=shellcmd -nargs=* R belowright 15new | r ! <args>

"## Start Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on


"## Syntastic ##

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"# C/C++
"let g:syntastic_c_check_header = 1
"let g:syntastic_c_compiler = 'gcc'

"# LaTeX
"let g:syntastic_tex_chktex_showmsgs = 1


"## Tagbar ##
let g:tagbar_ctags_bin = "/usr/bin/ctags"


"## Youcompleteme ##
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

"## Airline ##
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme='ubaryd'

"# Keybindings
:nmap \e :NERDTreeToggle<Cr>
:nmap \t :TagbarToggle<Cr>
