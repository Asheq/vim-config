TODO
================================================
- Improve text editing
	- Finish "Key Bindings" website
		- Finish documenting normal-mode keys
		- Prettify styling
		- Fix legends
	- Refactor mappings
		- Prune and simplify
		- Submit issues on repos that map in select mode when they shouldn't (:verbose smap)
	- Learn how to extend Vim using VimScript, Lua, and JavaScript
	- Learn how to create the motions, operators, and text objects
	- Add motions
		- tmhedberg/indent-motion
		- jeetsukumaran/vim-indentwise
		- "g{" and "g}" to move to the first/last character of a paragraph
	- Add operators
		- tommcdo/vim-exchange
		- Set search register (will replace visual-star)
		- Populate quickfix list
			- Search in file
			- Search in project
		- Maniulate strings (https://github.com/magnars/s.el or https://vocajs.com/)
	- Add text objects
		- thinca/vim-textobj-between
		- Julian/vim-textobj-variable-segment
		- saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines
		- vimtaku/vim-textobj-keyvalue
	- Add other plugins related to text editing:
		- AndrewRadev/switch.vim
		- AndrewRadev/splitjoin.vim
	- Get text editing ideas from other vimrcs

- Improve general experience
	- Create mapping "sub-modes"
	- Apply "recognize over recall" principle
		- Learn to use fzf with custom lists
	- Add pseewald/vim-anyfold
	- Add andymass/vim-matchup

- Improve IDE experience
	- Improve :terminal
		- Replace tmux with :terminal if possible
		- Report bugs
			- Rogue escape codes
		- Explore REPL options
	- Integrations with git/scm
		- chrisbra/vim-diff-enhanced
		- easily view side-by-side diffs of staged or unstaged changes
		- show staged or unstaged changes to a file in the window gutter
		- show status of files in dirvish or other file explorer
		- easily do git tasks like stage, unstage, resolve merge conflicts, etc.
	- Add snippets
	- Add on-the-fly syntax checking
	- Add as-you-type code completion
	- Add Language Server Protocol enhancements
	- Add ability to debug code
	- Add ability to easily do a project-wide search, followed by a project-wide replace
	- Add a persistent file drawer
	- Add a minimap
	- Add code "table of contents" (tagbar)
	- Add language-specific enhancements
		- Add Emmet for writing HTML
	- Get IDE ideas from other vimrcs and other apps
		- Other vimrcs
		- Spacevim
		- Emacs
		- VSCode
		- Webstorm
		- Oni
		- Sublime
		- Atom

- Improve other workflows
	- Improve note taking
	- Add grammar checking
	- Improve file browsing and management
	- Add ability to view and write email
	- Add ability to view and manage projects/todo/calendar

MOTIONS
================================================
Characterwise
-------------
*exclusive*
h
l
0
^
g0
g^
gm
|
F{char}
T{char}
gk (only characterswise when lines wrap)
gj (only characterswise when lines wrap)
:[range]
[count]go, [count]go
w
W
b

*inclusive*
$
g_
g$
f{char}
t{char}
{count}%
e
E
ge
gE

Linewise (inclusive of last line by default)
-------------
j
k
-
+
_
G
gg

REFERENCE MANUAL:
================================================

Basic editing ~
|motion.txt|	7/20 commands for moving around
|scroll.txt|	7/21 scrolling the text in the window
|insert.txt|	7/22 Insert and Replace mode
|change.txt|	7/23 deleting and replacing text
|indent.txt|	7/24 automatic indenting for C and other languages
|undo.txt|	7/25 Undo and Redo
|repeat.txt|	7/26 repeating commands, Vim scripts and debugging
|visual.txt|	7/27 using the Visual mode (selecting a text area)
|various.txt|	7/28 various remaining commands
|recover.txt|	7/29 recovering from a crash

Advanced editing ~
|cmdline.txt|	7/30 Command-line editing
|options.txt|	7/31 description of all options
|pattern.txt|	8/01 regexp patterns and search commands
|map.txt|	8/02 key mapping and abbreviations
|tagsrch.txt|	8/03 tags and special searches
|quickfix.txt|	8/04 commands for a quick edit-compile-fix cycle
|windows.txt|	8/05 commands for using multiple windows and buffers
|tabpage.txt|	8/06 commands for using multiple tab pages
|syntax.txt|	8/07 syntax highlighting
|spell.txt|	8/08 spell checking
|diff.txt|	8/09 working with two to four versions of the same file
|autocmd.txt|	8/10 automatically executing commands on an event
|filetype.txt|	8/11 settings done specifically for a type of file
|eval.txt|	8/12 expression evaluation, conditional commands
|fold.txt|	8/13 hide (fold) ranges of lines
