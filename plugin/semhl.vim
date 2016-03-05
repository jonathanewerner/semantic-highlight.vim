"
" Autocmds for filetypes
"
" Allow users to configure the plugin to auto start for certain filetypes
if (exists('g:semanticEnableFileTypes'))
	if type(g:semanticEnableFileTypes) == type([])
		execute 'autocmd FileType ' . join(g:semanticEnableFileTypes, ',') . ' call s:enableHighlight()'
	elseif type(g:semanticEnableFileTypes) == type({})
		execute 'autocmd FileType ' . join(keys(g:semanticEnableFileTypes), ',') . ' call s:enableHighlight()'
		execute 'autocmd CursorHold ' . join(map(values(g:semanticEnableFileTypes), '"*." . v:val'), ',') . ' call s:highlight()'
	endif
endif

"
" Read user configuration overrides
"
let s:defaultColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
let s:colors = exists('g:semanticGUIColors') ? g:semanticGUIColors : s:defaultColors

" Allow the user to turn cache off
let g:semanticUseCache = exists('g:semanticUseCache') ? g:semanticUseCache : 1
let g:semanticPersistCache = exists('g:semanticPersistCache') ? g:semanticPersistCache : 1
let g:semanticPersistCacheLocation = exists('g:semanticPersistCacheLocation') ? g:semanticPersistCacheLocation : $HOME . '/.semantic-highlight-cache'

" Allow the user to override blacklists
let g:semanticEnableBlacklist = exists('g:semanticEnableBlacklist') ? g:semanticEnableBlacklist : 1

let s:blacklist = {}
if g:semanticEnableBlacklist
	let s:blacklist = blacklist#GetBlacklist()
endif

"
" Functions
"
" Execute highlighting and set buffer-local 'semanticOn' flag
function! s:enableHighlight()
	call s:highlight()
	let b:semanticOn = 1
endfunction


let s:hasBuiltColors = 0

command! SemanticHighlight call s:highlight()

function! s:highlight()
	if s:hasBuiltColors == 0
    " Side effect: execute `highlight` commands for supplied colors
		call s:buildColors(s:colors)
    let s:hasBuiltColors = 1
	endif

	let bufferLinesCount = line('$')
	let pattern = '\<[\$]*[a-zA-Z\_][a-zA-Z0-9\_]*\>'
	let currentColor = 0
	let colorsCount = len(s:colors)

  " Iterate through buffer lines starting at the bottom
	while bufferLinesCount
		let currentLine = getline(bufferLinesCount)
    echom "currentLine:" currentLine

		let charPositionForLine = 0
		while 1
			let word = matchstr(currentLine, pattern, charPositionForLine)

      echom "word:" word

			if (empty(word))
				break
			endif

			let l:noBlackListExistsForFileType = empty(s:blacklist) || !has_key(s:blacklist, &filetype)
			if (l:noBlackListExistsForFileType || index(s:blacklist[&filetype], word) == -1)

				execute 'syn keyword _semantic' . currentColor . ' ' . word

				let currentColor = (currentColor + 1) % colorsCount
			endif

			let charPositionForLine += len(word) + 1
		endwhile
		let bufferLinesCount -= 1
	endwhile
endfunction

"
" Execute `highlight` definitions for each color of `colors`
"
function! s:buildColors(colors)
	let i = 0
	for semanticColor in a:colors
		execute 'highlight! def _semantic' . i . ' ' . 'guifg=' . semanticColor
		let i += 1
	endfor
endfunction
