Improve text editing
================================================
	- Finish "Key Bindings" website
	- Refactor mappings
		- Prune mappings that are not very useful
		- Choose "perfect" keys using website
		- Move RHS of complicated mappings into autoloaded functions
		- Toggling wrap, spell, list, etc. takes too many keypresses (use \ prefix?)
		- Window commands take too many keypresses (use alt?)
	- Learn how to extend Vim using:
		- VimScript
		- Lua
		- JavaScript
	- Learn Vim/NeoVim API
	- Learn how to create motions, operators, and text objects
		- Add motions
			- tmhedberg/indent-motion (PLUGIN)
			- jeetsukumaran/vim-indentwise (PLUGIN)
		- Add operators
			- Set search register to replace visual-star
			- Populate quickfix list
				- Search in file
				- Search in project
			- tommcdo/vim-exchange (PLUGIN)
		- Add text objects
			- thinca/vim-textobj-between (PLUGIN)
			- Julian/vim-textobj-variable-segment (PLUGIN)
			- saihoooooooo/vim-textobj-space (PLUGIN)
			- zandrmartin/vim-textobj-blanklines (PLUGIN)
			- vimtaku/vim-textobj-keyvalue (PLUGIN)
	- Add other plugins related to text editing:
		- AndrewRadev/switch.vim (PLUGIN)
		- AndrewRadev/splitjoin.vim (PLUGIN)

Improve general experience
================================================
	- I don't know what window I am in easily and quickly
	- I don't know easily that I'm in a dirvish buffer or quickfix buffer
	- When foldenable is off, foldcolumn should not show up (issue)
	- I don't know where I am within a window. A scrollbar would be *really* nice (issue)
	- Think about dealing with lists or choices:
		- fzf
		- dirvish-like
		- commandline
		- confirm()
		- other?
	- Change slashes in file paths to a more distinguishable character or color
	- Make videos comparing vim and emacs terminal
	- Respond to "How I Learned..."
		Why?
			- Evil
			- Org mode
			- Large codebases (asynchronous)
			- Neovim
		Emacs over vim that do not apply anymore
			- asynchronous processing
			- terminal emulation
			- decoubled server and client
			- "better" software package
	- Read "Modern Vim"
	- Improve dirvish
		- Use for most recently-used files
		- Create a ranger-like view
		- Sometimes the cursor floats on the right
	- Improve fzf
		- Optimize :Files and :History for file-paths like nixprime/cpsm. Compare with
		  Sublime and Webstorm
		- Report bug: sometimes text is scrolled out of view (https://github.com/junegunn/fzf.vim/issues/385)
	- Apply "recognize over recall" principle everywhere
		- Learn to use fzf with custom lists
	- tpope/vim-projectionist
	- tpope/vim-capslock
	- Where is ignorecase and smartcase used?
	- Understand discrepencies for windows/buffers/type for help/quickfix/preview
	- Customize existing plugins
	- Follow up on lion.vim smap issue
	- LineNr and CursorLineNr should not be overridden by Folded in colorscheme
	- Make opening entries in dirvish and quickfix consistent
	- Add pseewald/vim-anyfold
	- Add andymass/vim-matchup
	- Add ability to easily do a project-wide search, followed by a project-wide replace
	- Create mapping "sub-modes"
	- Show search index (google/vim-searchindex)
	- Add issues to (n)vim repo to see if things that plugins do can be added to vim core

Improve IDE experience
================================================
	- Add git integrations
		- chrisbra/vim-diff-enhanced
		- Easily view side-by-side diffs of staged or unstaged changes
		- Show staged or unstaged changes to a file in the window gutter
		- Easily do git tasks like stage, unstage, resolve merge conflicts, etc.
		- Explore magit
	- Get IDE ideas from other vimrcs and other apps
		- Other vimrcs
		- Spacevim
		- Emacs
		- Webstorm
		- Oni
		- VSCode
		- Atom
		- Sublime
	- Add errorlists via :make, :makeprg, and :compiler
	- Add REPL support
	- Add snippets
	- Add code "table of contents" with tagbar
	- Add Emmet for writing HTML
	- Add on-the-fly linting
	- Add Language Server Protocol enhancements (WAIT FOR NEOVIM SUPPORT)
		- Code navigation (go to definition, go to parent function, find inheriting
		  functions, go to uses, etc.)
	- Perfect syntax highlighting via new syntax API (WAIT FOR NEOVIM SUPPORT)
	- Add as-you-type code completion (WAIT FOR NEOVIM SUPPORT)
	- Add debugger integrations (WAIT/ASK FOR NEOVIM SUPPORT)

Improve other workflows
================================================
	- Improve file browsing and management
		- Look at ranger
		- Look at extending dirvish
	- Add ability to view and write email
		- Look at mutt
	- Improve writing
		- https://www.reddit.com/r/vim/comments/53y9wn/a_writer_in_search_of_an_editor_that_lasts_a/
		- Add grammar checking
