# semantic-highlight.vim

This plugin syntax highlights each unique word with an unique color.

![semantic-highlight](https://cloud.githubusercontent.com/assets/3755413/13548558/65de3b68-e2f3-11e5-9362-8c5fddb564a0.png)

Use it like this:

```
autocmd FileType jsx,javascript call semhl#highlight()
autocmd CursorHold *.jsx,*.js call semhl#highlight()
```

This will run the highlighting on file load and when you hold the cursor for
the specified file types / endings.

It's not per se language specific, but blacklisted keywords (won't be colored) are only available
for javascript at the moment. Feel free to submit pull requests for more
blacklists or fork it.

### why

I've been using https://github.com/jaxbot/semantic-highlight.vim over a year now. It's pretty essential for my vim usage, so **thanks Jonathan**. :) I forked this in an effort to learn VimL. In the process i slimmed down the API surface and refactored the code, primarily as a learning effort.

Stuff I don't need from the original & reasons:
- Caching. I don't like it because it leads to variables unnecessarily having the same colors and code complexity. I also don't care if variable -> color mappings are persisted across files.
- Non-GUI colors. For me the concept doesn't make much sense with 16 colors. I've got way more identifiers per file on average.
- Weird API for specifying needed autocmds. I'd rather have that in userland. :)

Stuff I might have improved:
- The blacklist lookup was implemented as a search through an array = O(n). I replaced it with a dictionary lookup = ~O(1). This lookup occured in the central tight loop of the algorithm, so perf benefits could be huge. Haven't found out how to profile. :) 
