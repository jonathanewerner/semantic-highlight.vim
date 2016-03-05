# semantic-highlight.vim

This plugin syntax highlights each unique word with an unique color.

![semantic-highlight](https://cloud.githubusercontent.com/assets/3755413/13549749/fb8df608-e30c-11e5-9a1b-65845e70ca86.png)

Use it like this:

```viml
" Install it with some plugin manager. :)
Plugin jonathanewerner/semantic-highlight

" Define autocmds that trigger the highlighting function on given filetypes
autocmd FileType jsx,javascript call semhl#highlight()

" Optionally also recompute on CursorHold. Neat when you're actually adding
"variables to your code. ;)
autocmd CursorHold *.jsx,*.js call semhl#highlight()
```

It's generally language agnostic as it justs iterates through all lines of a
file and then finds tokens with a simple word-ish regex, but there are
"blacklisted" words for some languages, see `autoload/semhl/config.vim`.
In the screenshot, for example, `export`, `function`, `return` & `const` are on the blacklist.

You can override the default blacklist like this:

```viml
let g:semhl_blacklist = {
\  'javascript': {
\    'var': 0,
\    'function': 1,
\     ...
\  },
\  'python': {
\     ...
\  },
\}
```

This will completely override the built in blacklist dictionary, so you might want to copy paste from `autoload/semhl/config.vim`.

====================================================================


### why

I've been using https://github.com/jaxbot/semantic-highlight.vim over a year now. It's pretty essential for my vim usage, so **thanks Jonathan**. :) I forked this in an effort to learn VimL. In the process i slimmed down the API surface and refactored the code, primarily as a learning effort.

Stuff I don't need from the original & reasons:
- Caching. I don't like it because it leads to variables unnecessarily having the same colors and code complexity. I also don't care if variable -> color mappings are persisted across files.
- Non-GUI colors. For me the concept doesn't make much sense with 16 colors. I've got way more identifiers per file on average.
- Weird API for specifying needed autocmds. I'd rather have that in userland. :)

Stuff I might have improved:
- The blacklist lookup was implemented as a search through an array = O(n). I replaced it with a dictionary lookup = ~O(1). This lookup occured in the central tight loop of the algorithm, so perf benefits could be huge. Haven't found out how to profile. :) 
- I put all code in `autoload`. When running `vim --startuptime` with the original plugin, i found that it took ~500ms alone. (Don't fully understand why). With all code in `autolad` this issue appears to have gone.
