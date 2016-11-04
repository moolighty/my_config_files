" Script Name: markword.vim
" Version:     1.0
" Last Change: July 1, 2004
" Author:      Yuheng Xie <elephant@linux.net.cn>
"
" Description: a little script to highlight several words in different colors
"              simultaneously
"
" Usage:       Just call MarkWord() to mark or unmark a word, or call
"              MarkNone() to unmark all marked words.
"
"              You may map keys for the calls in your vimrc file for
"              convenience. Example:
"              map \m :call MarkWord()<cr>
"              map \c :call MarkNone()<cr>
"              To mark or unmark a word, just put the cursor over the word and
"              press \m. To unmark all marked words, press \c.
"
"              The default colors/groups setting is for marking three
"              different words in different colors. You may define your colors
"              in your vimrc file. That is to define highlight group names as
"              "MarkWordN", where N is a number. An example could be found
"              below.
"
" Bugs:        some colored words could not be highlighted

" default colors/groups
" you may define your colors in you vimrc file, in the form as below:
hi MarkWord1  ctermbg=Blue     guibg=#A4E57E
hi MarkWord2  ctermbg=DarkRed       guibg=#8CCBEA
hi MarkWord3  ctermbg=DarkGray      guibg=#FFDB72

" please map keys to call MarkWord() and MarkNone() in your vimrc file to
" trigger the functions. example:
" map \m :call MarkWord()<cr>
" map \c :call MarkNone()<cr>

" mark or unmark the word under or before the cursor
function! MarkWord()
	" define variables if they don't exist
	if !exists("g:mwCycleMax")
		let i = 1
		while hlexists("MarkWord" . i)
			let i = i + 1
		endw
		let g:mwCycleMax = i - 1
	endif
	if !exists("b:mwCycle")
		let b:mwCycle = 1
	endif
	let i = 1
	while i <= g:mwCycleMax
		if !exists("b:mwWord" . i)
			let b:mwWord{i} = ""
		endif
		let i = i + 1
	endw

	" get the word under or before the cursor
	let currentWord = FindPrevWord()

	if currentWord == ""
		return
	endif

	" clear the mark if current word is marked
	let i = 1
	while i <= g:mwCycleMax
		if currentWord == b:mwWord{i}
			let b:mwWord{i} = ""
			exe "syntax clear MarkWord" . i
			return
		endif
		let i = i + 1
	endw

	" choose an unused mark group
	let i = 1
	while i <= g:mwCycleMax
		if b:mwWord{i} == ""
			let b:mwWord{i} = currentWord
			if i < g:mwCycleMax
				let b:mwCycle = i + 1
			else
				let b:mwCycle = 1
			endif
			exe "syntax clear MarkWord" . i
			exe "syntax match MarkWord" . i . " /\\<" . currentWord . "\\>/"
			return
		endif
		let i = i + 1
	endw

	" choose a mark group by cycle
	let i = 1
	while i <= g:mwCycleMax
		if b:mwCycle == i
			let b:mwWord{i} = currentWord
			if i < g:mwCycleMax
				let b:mwCycle = i + 1
			else
				let b:mwCycle = 1
			endif
			exe "syntax clear MarkWord" . i
			exe "syntax match MarkWord" . i . " /\\<" . currentWord . "\\>/"
			return
		endif
		let i = i + 1
	endw
endfunction

" unmark all marked words
function! MarkNone()
	if !exists("b:mwCycle")
		return
	endif

	let i = 1
	while i <= g:mwCycleMax
		if b:mwWord{i} != ""
			let b:mwWord{i} = ""
			exe "syntax clear MarkWord" . i
		endif
		let i = i + 1
	endw
endfunction

" return the word under or before the cursor
function! FindPrevWord()
	let line = getline(".")
	if line[col(".") - 1] =~ "\\w"
		return expand("<cword>")
	else
		return substitute(strpart(line, 0, col(".") - 1), "^.\\{-}\\(\\w\\+\\)\\W*$", "\\1", "")
	endif
endfunction

