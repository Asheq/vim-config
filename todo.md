TODO
================================================
- Focus on improving text editing
	- Finish keys website
	- Refactor mappings:
		- Prune and simplify
		- Submit issues on repos that map in select mode when they shouldn't (:verbose smap)
		- Create submodes
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
	- Make all interactions as silent as possible without being confusing
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
	- https://github.com/tonsky/FiraCode
- Other parts of workflow
	- Email
	- File browsing
	- Grammar checker
	- Note taking (orgmode)

REFERENCE MANUAL:
================================================

Basic editing ~
|starting.txt|	starting Vim, Vim command arguments, initialisation
|editing.txt|	editing and writing files
|motion.txt|	commands for moving around
|scroll.txt|	scrolling the text in the window
|insert.txt|	Insert and Replace mode
|change.txt|	deleting and replacing text
|indent.txt|	automatic indenting for C and other languages
|undo.txt|	Undo and Redo
|repeat.txt|	repeating commands, Vim scripts and debugging
|visual.txt|	using the Visual mode (selecting a text area)
|various.txt|	various remaining commands
|recover.txt|	recovering from a crash

Advanced editing ~
|cmdline.txt|	Command-line editing
|options.txt|	description of all options
|pattern.txt|	regexp patterns and search commands
|map.txt|	key mapping and abbreviations
|tagsrch.txt|	tags and special searches
|quickfix.txt|	commands for a quick edit-compile-fix cycle
|windows.txt|	commands for using multiple windows and buffers
|tabpage.txt|	commands for using multiple tab pages
|syntax.txt|	syntax highlighting
|spell.txt|	spell checking
|diff.txt|	working with two to four versions of the same file
|autocmd.txt|	automatically executing commands on an event
|filetype.txt|	settings done specifically for a type of file
|eval.txt|	expression evaluation, conditional commands
|fold.txt|	hide (fold) ranges of lines
