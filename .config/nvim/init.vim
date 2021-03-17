let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'kocotian/vim-dired'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'kocotian/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'sukima/xmledit'
call plug#end()

colorscheme code16
set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set tabstop=4
set shiftwidth=4
set noexpandtab

" j & k goes one visible line down, not one physical
nnoremap j gj
nnoremap k gk

" <C-O> is just o, but without insert mode
nnoremap <C-O> o<Esc>

" Compilation and others
noremap <F8> :Vimwiki2HTML<CR>
noremap <F9> :!make<CR>
noremap <F10> :!make install<CR>
noremap <F11> :!compiler %<CR>
noremap <F12> :!sent %<CR>

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to Shift+<F1> (en) and Shift+<F2> (pl):
	map <F13> :setlocal spell! spelllang=en<CR>
	map <F14> :setlocal spell! spelllang=pl<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
	nnoremap <C-S> :s//g<Left><Left>
	vnoremap <C-S> :s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	map <leader>dd :DiredHere<CR>
	map <leader>D :Dired<CR>
	let g:vimwiki_list = [{'path': '~/dox/vimwiki', 'syntax': 'default', 'ext': '.wiki'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufRead,BufNewFile *.asm set filetype=nasm

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" --- NerdTree --- "
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
    nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" --- Terminal --- "

" turn terminal to normal mode with escape
    tnoremap <Esc> <C-\><C-n>
" disable line numbers on terminal
    autocmd TermOpen * setlocal nonumber norelativenumber
" start terminal in insert mode
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
    function! OpenTerminal()
        split term://zsh
        resize 10
    endfunction
    nnoremap <c-t> :call OpenTerminal()<CR>

let g:xmledit_enable_html = 1
autocmd FileType html nnoremap <F24><F24> <Esc><Esc>:!$BROWSER file:///'%:p' &<CR>
autocmd FileType html nnoremap <F24>q <Esc><Esc>:!qutebrowser file:///'%:p' &<CR>
autocmd FileType html nnoremap <F24>s <Esc><Esc>:!surf file:///'%:p' &<CR>
autocmd FileType html nnoremap <F24>c <Esc><Esc>:!chromium file:///'%:p' &<CR>

" Scratch
	autocmd BufRead,BufNewFile scratch.* set filetype=vimwiki
	autocmd BufRead,BufNewFile scratch.* normal G
	autocmd BufRead,BufNewFile scratch.* startinsert

" Macros
	let @B = "069lf r\n"
	nnoremap ;BB 9999@B

" Abbrevs
	" General
	vnoremap ;s :sort<CR>
	inoremap ;M <++>

	nnoremap <C-S-K> kkjjddkP
	nnoremap <C-S-J> jkddp
	vnoremap <C-S-K> kkjjddkP
	vnoremap <C-S-J> jkddp
	inoremap <C-S-K> <Esc>kkjjddkPi
	inoremap <C-S-J> <Esc>jkddpi

	" Spaces
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space><Space> <Esc>0/<++><CR>4s
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space>d<Space> <Esc>0/<++><CR>ddi
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space>k<Space> <Esc>0/<+++><CR>5s

	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space>n<Space> <Esc>/<++><CR>4s
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space>dn<Space> <Esc>/<++><CR>ddi
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap <Space>kn<Space> <Esc>/<+++><CR>5s

	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap ;<Space>p<Space> <Esc>?<++><CR>4s
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap ;<Space>dp<Space> <Esc>?<++><CR>ddi
	autocmd FileType html,php,c,cpp,vimwiki,tex inoremap ;<Space>kp<Space> <Esc>?<+++><CR>5s

	autocmd FileType html,php,c,cpp,vimwiki,tex nnoremap ;<Space> i<Space><Esc>l

	" HTML, PHP
	autocmd FileType html,php inoremap ;! <!DOCTYPE html><CR><html><CR><head><CR><meta charset="UTF-8" /><CR><title><+++></title><CR><++><CR></head><CR><body><CR><++><CR></body><CR></html><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;o <CR><+++><CR><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;1 <h1><+++></h1><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;2 <h2><+++></h2><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;3 <h3><+++></h3><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;4 <h4><+++></h4><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;5 <h5><+++></h5><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;6 <h6><+++></h6><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;b <b><+++></b><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;i <i><+++></i><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;u <u><+++></u><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;st <s><+++></s><++><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;a <a href="<+++>"><++></a><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;I <img src="" /><Esc>3li
	autocmd FileType html,php inoremap ;p <p><+++></p><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;d <div><CR><++><CR></div><Esc>?<++><CR>4s
	autocmd FileType html,php inoremap ;Dc <div class="<+++>"><++></div><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;sp <span><+++></span><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;sup <sup><+++></sup><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;sub <sub><+++></sub><Esc>?<+++><CR>5s
	autocmd FileType html,php inoremap ;t <Tagname><++></Tagname><Esc>2?Tagname<CR>
	autocmd FileType html noremap ;: <Esc>:set ft=php<CR>
	autocmd FileType php noremap ;: <Esc>:set ft=html<CR>

	" C
	autocmd FileType c,cpp inoremap ;! #include <stdio.h><CR><CR>int<CR>main(int argc, char *argv[])<CR>{<CR><+++><CR>}<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;in #include <<+++>><CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;IS #include <stdio.h><CR>#include <stdlib.h><CR>#include <string.h><CR>#include <unistd.h><CR><CR>
	autocmd FileType c,cpp inoremap ;de #define<Space>
	autocmd FileType c,cpp inoremap ;vi int
	autocmd FileType c,cpp inoremap ;vc char
	autocmd FileType c,cpp inoremap ;vs char *
	autocmd FileType c,cpp inoremap ;vp <+++> *<++>
	autocmd FileType c,cpp inoremap ;fc <+++>(<++>);<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;fn <+++>(<++>)<CR>{<CR><++><CR>}<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;mm int<CR>main(int argc, char *argv[])<CR>{<CR><+++><CR>}<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;mv int<CR>main(void)<CR>{<CR><+++><CR>}<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;cm <++> /* <+++> */<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;co <++><Esc>o/* <+++> */<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;cO <++><Esc>O/* <+++> */<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;ca <++><Esc>A<Space>/* <+++> */<Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;ci <++><Esc>I/* <+++> */<Space><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;pf printf("<+++>"<++>);<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;if if (<+++>) {<CR><++><CR>} <++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;ei else if (<+++>) {<CR><++><CR>} <++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;el else {<CR><+++><CR>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;wh while (<+++>) {<CR><++><CR>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;fo for (<+++>) {<CR><++><CR>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;do do {<CR><++><CR>} while (<+++>);<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;st typedef struct {<CR><++><CR>} <+++>;<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;un typedef union {<CR><++><CR>} <+++>;<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;en typedef enum { <++> } <+++>;<CR><++><Esc>?<+++><CR>5s
	autocmd FileType c,cpp inoremap ;PP <++><Esc>f)i,<Space>
	autocmd FileType c,cpp inoremap ;Ps %s<++><Esc>f)i,<Space>
	autocmd FileType c,cpp inoremap ;Pd %d<++><Esc>f)i,<Space>
	autocmd FileType c,cpp inoremap ;Pc %c<++><Esc>f)i,<Space>
	autocmd FileType c,cpp inoremap ;Pld %ld<++><Esc>f)i,<Space>

	" VimWiki
	autocmd FileType vimwiki inoremap ;1 = <+++> =<CR><++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;2 == <+++> ==<CR><++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;3 === <+++> ===<CR><++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;4 ==== <+++> ====<CR><++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;5 ===== <+++> =====<CR><++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;b *<+++>* <++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;i _<+++>_ <++><Esc>?<+++><CR>5s
	autocmd FileType vimwiki inoremap ;l [[<+++>]]<Esc>?<+++><CR>5s

	autocmd FileType vimwiki inoremap ;,r ,r,r<Esc>hi
	autocmd FileType vimwiki inoremap ;,g ,g,g<Esc>hi
	autocmd FileType vimwiki inoremap ;,y ,y,y<Esc>hi
	autocmd FileType vimwiki inoremap ;,b ,b,b<Esc>hi
	autocmd FileType vimwiki inoremap ;,m ,m,m<Esc>hi
	autocmd FileType vimwiki inoremap ;,c ,c,c<Esc>hi
	autocmd FileType vimwiki inoremap ;,R ,R,R<Esc>hi
	autocmd FileType vimwiki inoremap ;,G ,G,G<Esc>hi
	autocmd FileType vimwiki inoremap ;,Y ,Y,Y<Esc>hi
	autocmd FileType vimwiki inoremap ;,B ,B,B<Esc>hi
	autocmd FileType vimwiki inoremap ;,M ,M,M<Esc>hi
	autocmd FileType vimwiki inoremap ;,C ,C,C<Esc>hi

	" LaTeX
	autocmd FileType tex inoremap ;! \documentclass{article}<CR>\author{<+++>}<CR>\title{<++>}<CR><CR>\begin{document}<CR>\maketitle<CR>\tableofcontents<CR><CR><++><CR>\end{document}<Esc>?<+++><CR>5s
	autocmd FileType tex inoremap ;bf \textbf{} <++><Esc>T{i
	autocmd FileType tex inoremap ;it \textit{} <++><Esc>T{i
	autocmd FileType tex inoremap ;tt \texttt{} <++><Esc>T{i
	autocmd FileType tex inoremap ;beg \begin{something}<CR><++><CR>\end{something}<Esc>2?something<CR>
	autocmd FileType tex inoremap ;1 \section{<+++>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType tex inoremap ;2 \subsection{<+++>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType tex inoremap ;3 \subsubsection{<+++>}<CR><++><Esc>?<+++><CR>5s
	autocmd FileType tex inoremap ;up \usepackage{<+++>}<Esc>?<+++><CR>5s
