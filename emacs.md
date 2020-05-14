## Emacs
* `Ctrl+G` quits whatever emacs command you were trying to run, don't worry, you will not lose your work.
* All editing happens in an Emacs buffer. When you first start Emacs, a buffer named *scratch* is open. Emacs will always show you the name of the current buffer at the bottom of the window
* To create a fresh buffer, use `Ctrl+x,b`. When you create a new buffer this way, it exists only in memory until you save it as a file; buffers aren’t necessarily backed by files, and creating a buffer doesn’t necessarily create a file.
* Kill current buffer `Ctrl+x,k`
* Open a file `Ctrl+x+f`
* An emacs mode is a collection of key bindings and functions that are packaged together to help you be productive when editing different types of files. 
  * Modes come in two flavors: major modes and minor modes. For example, Markdown and Clojure are major modes. Major modes are usually set by emacs when you open a file, but you can also set the mode explicitly by running the relvant emacs command, for example with `Opt+x clojure-mode`. Only one major mode is active at a time.
  * Minor modes usually provide functionality that's useful across file types. For example, `abbrev` mode "automatically expands text based on pre-defined abbreviation definitions". You can have multiple minor modes active at the same time. 

### Installing packages
* Many modes are distributed as packages, which are just bundles of elist files stored in a package repository. Emacs makes it very easy to browse and install packages. `Opt+x package-list-packages` will show you almost every package available; just make sure you run `Opt+x package-refresh-contents` first so you get the latest list. You can install packages with `Opt+x package-install`

### Point
* The cursor appears to rest on top of a character, the `point` is actually located between the character and the previous one.
* Common commands for movement
  * `Ctrl+a` move to beginning of line
  * `Ctrl+e` move to end of line
  * `Opt+m` move to first non-whitespace character on the line
  * `Opt+f` move forward one word
  * `Opt+b` move backward one word
  * `Opt+g,g` go to line

### Selection with Regions
* In emacs, we don't select text. We create regions, and we do so by setting the mark with `Ctrl+spacebar`. Then, when you move point, everythin between mark and point is the regions. It's very similar to shift-selecting text for basic purposes.
* One cool thing about using mark instead of Shift-selecting text is that you're free to use all of emacs's movement commands after you set the mark. 

| Command | Description |
|---|---|
| `Ctr+x+c` | To end Emacs session |
| `Ctrl+v` | Move forward one screenful |
| `Opt+v` | Move backward one screenful |
| `Ctrl+l` | Move cursor to center of screen |
| `Ctrl+p` | Move cursor to previous line |
| `Ctrl+n` | Move cursor to next line |
| `Ctrl+f` | Move cursor forward |
| `Ctrl+b` | Move cursor backward |
| `Opt+a` | Move cursor to start of sentence |
| `Opt+e` | Move cursor to end of sentence |
| `Opt+<` | Move to beginning of document (notice you'll need to use `Shift+,` key to get `<`) |
| `Opt+>` | Move to end of document (notice you'll need to use `Shift+.` key to get `>`) |
| `Ctrl+u, #, <command>` | `Repeat-count` a command, for e.g. `Ctrl+u, 8, Ctrl+n` will move forward 8 lines |
| `Ctrl+x, 1` | Expand the window, which contains the cursor, to occupy full screen (deletes all other windows) |
| `Ctrl+h, k, <command>` | To get help on a command, for e.g `Ctrl+h, k, Ctrl+f` shows documentation for `Ctrl+f` command |
| `Opt+backspace` | Delete word immediately before cursor |
| `Ctrl+d` | Delete next character after cursor |
| `Opt+d` | Delete next word after cursor |
| `Ctrl+k` | Delete from cursor position to end of line |
| `Opt+k` | Delete from cursor position to end of current sentence |
| `Ctrl+w` | Cut selected region to clipboard ring |
| `Ctrl+y` | Paste text that was last pushed to clipboard ring (does not remove it from clipboard ring) |
| `Ctrl+/` | Undo command |
| `Ctrl+x+s` | Save file |
| `Ctrl+x+b` | List buffers |
| `Ctrl+x, b` | Switch buffer |
| `Ctrl+h,m` | View documentation on current major mode |
| `Ctrl+s` | Start incremental search, repeat `Ctrl+s` to search next occurrence of string you entered, `<return>` terminates incremental search. `Ctrl+s` starts a search that looks for search string AFTER the current cursor position. To search for something earlier in text, use `Ctrl+r` |
| `Ctrl+x,2` | Split the screen into two windows |
| `Ctrl+Opt+v` | Scroll text in other window |
| `Ctrl+x,2` | Split the screen into two windows |
| `Ctrl+x,o` | Switch to "other" window, you can use to switch between windows |


### eXtended Commands
* Named extended commands are commands which are used even less frequently, or commands which are used only in certain modes. Example is the command `replace-string`, which replaces one string with another in the buffer. You invoke such commands using `Opt+x` and Emacs prompts you at the bottom of the screen to type command name. Just type `repl s<TAB>` and Emacs will complete the same.
  * The `replace-string` command requires two arguments, the string to be replaced, and the string to replace it with. You must end each argument with `<return>`.
* Echo Area - If Emacs sees that you are typing multicharacter commands slowly, it shows them to you at the bottom of the screen in an area called "echo area".
* The line immediately above echo area is called mode line (it shows name of current buffer)
  * The stars near the front of this line mean that you have made changes to the text


### Clojure REPL in Emacs
* Open clojure project/file 
* CIDER allows you to start a REPL within Emacs and provides you with key bindings that allows you to interact with the REPL more efficiently. 
* Start REPL using `Opt+x,cider-jack-in`
* To execute a line, 
  * Go to end of line - `Ctrl+e`
  * To execute in REPL - `Ctrl+x+e`
* To compile current file (this makes REPL aware of the changes in file)
  * Use `Ctrl+c+k`
* To set namespace listed at the top of current file - `Ctrl+c,Opt+n+n`
