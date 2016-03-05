let s:colors = semhl#config#colors()
let s:blacklist = semhl#config#blacklist()

let i = 0
for color in s:colors
  execute 'highlight! def _semantic' . i . ' ' . 'guifg=' . color
  let i += 1
endfor

function! semhl#highlight()
  let noBlackListExistsForFileType = empty(s:blacklist) || !has_key(s:blacklist, &filetype)
  let blacklistForFileType = get(s:blacklist, &filetype)
	let bufferLinesCount = line('$')
	let pattern = '\<[\$]*[a-zA-Z\_][a-zA-Z0-9\_]*\>'
	let currentColor = 0
	let colorsCount = len(s:colors)

  " Iterate through buffer lines starting at the bottom
  let currentLineNumber = bufferLinesCount
	while currentLineNumber
		let currentLine = getline(currentLineNumber)

    " For this line, iterate over all words
		let charPositionOnLine = 0
		while 1
			let word = matchstr(currentLine, pattern, charPositionOnLine)

			if (empty(word))
				break
			endif

      " If the filetype doesn't have a blacklist / the word isn't on the blacklist,
      " add syntax information to word
			if (noBlackListExistsForFileType || !get(blacklistForFileType, word))
        execute 'syn keyword _semantic' . currentColor . ' ' . word
        let currentColor = (currentColor + 1) % colorsCount
			endif

			let charPositionOnLine += len(word) + 1
		endwhile
		let currentLineNumber -= 1
	endwhile
endfunction

