#!/usr/bin/env vim
" termux-clipboard.vim - Yank/Put to/from Android clipboard via Vim
" Version: 0.0.1
" Maintainer: S0AndS0
" License: AGPL-3.0
"
" Inspiration:
" - https://github.com/jasonccox/vim-wayland-clipboard
" - https://stackoverflow.com/questions/61379318/how-to-copy-from-vim-to-system-clipboard-using-wayland-and-without-compiled-vim
"
" See:
" - https://wiki.termux.com/wiki/Termux-clipboard-get
" - https://wiki.termux.com/wiki/Termux-clipboard-set


""
" Fast finish if already loaded or Vim version is bellow target
if exists('g:termux_clipboard__loaded') || v:version < 700
	finish
endif
let g:termux_clipboard__loaded = 1


""
" Merged dictionary without mutation
" Parameter: {dict} defaults
" Parameter: {...dict[]} overrides
" Return: {dict}
" See: {docs} :help type()
" See: {link} https://vi.stackexchange.com/questions/20842/how-can-i-merge-two-dictionaries-in-vim
function s:Dict_Merge(defaults, ...) abort
	let l:new = copy(a:defaults)
	if a:0 == 0
		return l:new
	endif

	for l:override in a:000
		for [l:key, l:value] in items(l:override)
			if type(l:value) == type({}) && type(get(l:new, l:key)) == type({})
				let l:new[l:key] = s:Dict_Merge(l:new[l:key], l:value)
			else
				let l:new[l:key] = l:value
			endif
		endfor
	endfor

	return l:new
endfunction


""
" Configurations that may be overwritten
let s:defaults = {}


""
" See: {docs} :help fnamemodify()
" See: {docs} :help readfile()
" See: {docs} :help json_decode()
if exists('g:termux_clipboard')
	if type(g:termux_clipboard) == type('') && fnamemodify(g:termux_clipboard, ':e') == 'json'
		let g:termux_clipboard = json_decode(join(readfile(g:termux_clipboard), ''))
	endif

	if type(g:termux_clipboard) == type({})
		let g:termux_clipboard = s:Dict_Merge(s:defaults, g:termux_clipboard)
	else
		let g:termux_clipboard = s:defaults
	endif
else
	let g:termux_clipboard = s:defaults
endif


""
" ... Registration of mode mapping should be added here...

""
" See: {docs} :help TextYankPost
" See: {docs} :help job_start
function! s:Termux_Yank()
	if v:event['regname'] == '+' || v:event['regname'] == ''
				silent call job_start(['termux-clipboard-set'] + [getreg(v:event['regname'])], {
					\ 	"in_io": "null",
					\ 	"out_io": "null",
					\ 	"err_io": "null",
					\ 	"stoponexit": "",
					\ })
	endif
endfunction

augroup TermuxYank
	autocmd!
	autocmd TextYankPost * call s:Termux_Yank()
augroup END

function! s:clipboard_to_unnamed()
	silent let @"=system('termux-clipboard-get')
endfunction

function! s:put(p, fallback)
	if a:fallback
			return a:p
	endif

	call s:clipboard_to_unnamed()
	return '""' . a:p
endfunction

function! s:ctrl_r(cr)
	call s:clipboard_to_unnamed()
	return a:cr . '"'
endfunction

nnoremap <expr> <silent> "+p <SID>put('p', v:false)
nnoremap <expr> <silent> "+P <SID>put('P', v:false)
nnoremap <expr> <silent> p <SID>put('p', has('clipboard') && clipboard !~ 'unnamedplus')
nnoremap <expr> <silent> P <SID>put('P', has('clipboard') && clipboard !~ 'unnamedplus')


vnoremap <expr> <silent> "+p <SID>put('p', v:false)
vnoremap <expr> <silent> "+P <SID>put('P', v:false)
vnoremap <expr> <silent> p <SID>put('p', has('clipboard') && &clipboard !~ 'unnamedplus')
vnoremap <expr> <silent> P <SID>put('P', has('clipboard') && &clipboard !~ 'unnamedplus')


inoremap <expr> <silent> <C-R>+ <SID>ctrl_r("\<C-R>")
inoremap <expr> <silent> <C-R><C-R>+ <SID>ctrl_r("\<C-R>\<C-R>")
inoremap <expr> <silent> <C-R><C-O>+ <SID>ctrl_r("\<C-R>\<C-O>")
inoremap <expr> <silent> <C-R><C-P>+ <SID>ctrl_r("\<C-R>\<C-P>")


" vim:foldmethod=marker:foldlevel=0
