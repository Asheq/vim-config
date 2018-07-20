TODO
================================================
- Focus on improving text editing
	- Finish keys website
		- Finish documenting normal-mode keys
		- Prettify styling
		- Add legend
	- Refactor mappings:
		- Prune and simplify
		- Submit issues on repos that map in select mode when they shouldn't (:verbose smap)
	- Learn how to create the following without and with helper plugins:
		- motions
		- operators
		- text objects
	- Add motions:
		- tmhedberg/indent-motion
		- jeetsukumaran/vim-indentwise
		- Add "g{" and "g}" to move to the first/last character of a paragraph
	- Add operators:
		- tommcdo/vim-exchange
		- populate quickfix list
			> search in file
			> search in project
		- set search register
		- https://github.com/magnars/s.el or https://vocajs.com/
		- more?
	- Add text objects:
		- thinca/vim-textobj-between
		- Julian/vim-textobj-variable-segment
		- saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines
		- vimtaku/vim-textobj-keyvalue
		- any kind of quotes "aq" and "iq"?
		- any kind of parens?
		- more?
	- Add other plugins related to text editing:
		- AndrewRadev/switch.vim
		- AndrewRadev/splitjoin.vim
	- Get text editing ideas from other vimrcs

- Focus on improving general vim experience
	- Create sub-modes
	- Use "recognize over recall" principle
	- Learn to use fzf to narrow more kinds of lists
	- Window zoom plugin
	- pseewald/vim-anyfold
	- andymass/vim-matchup

- Focus on improving IDE experience
	- Integrations with git/scm
		- chrisbra/vim-diff-enhanced
		- easily view side-by-side diffs of staged or unstaged changes
		- show staged or unstaged changes to a file in window gutter
		- show status of files in file drawer
		- easily do git tasks like stage, unstage, etc.
		- Magit!
	- Snippets
	- Emmet for writing HTML
	- Language Server Protocol
	- Real-time code linting
	- Get IDE ideas from other vimrcs and other apps
		- Other vimrcs
		- Spacevim
		- Emacs
		- VSCode
		- Webstorm
		- Oni
		- Sublime
		- Atom
	- Easily do a project-wide search, followed by a project-wide replace
	- A file drawer
	- Minimap
	- Toggle a persistent terminal
	- Start debugging
	- Code "structure" (tags?)
- Other parts of workflow
	- Note taking
	- Grammar checker
	- File browsing
	- Email
	- Org-mode!

MOTIONS
================================================
Characterwise
-------------
h	e
l	e
0	e
^	e
g0	e
g^	e
gm	e
|	e
F{char}	e
T{char}	e
gk	e (only characterswise when lines wrap)
gj	e (only characterswise when lines wrap)

$	i
g$	i
f{char}	i
t{char}	i

g_	?

Linewise
-------------
j
k
-
+
_

%	?

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
