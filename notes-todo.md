Improve text editing
================================================
	- Finish "Key Bindings" website
		- Finish documenting normal-mode keys:
			- beginning with operator
			- other
		- Fix:
			- legends
			- descriptions
		- Prettify styling
		- Post on reddit and request feedback
	- Refactor mappings
		- Prune mappings that are not very useful
		- Choose "perfect" keys using website
		- Move RHS of complicated mappings into autoloaded functions
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
			- Manipulate strings
				- Reference https://github.com/magnars/s.el
				- Reference https://vocajs.com/
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
	- Follow up on dirvish and git-dirvish issues
	- Follow up on lion.vim smap issue
	- Change cursor color to be more bright
	- Suggest that plugin authors take donations
	- Improve dirvish
		- Use for most recently-used files
		- Create a ranger-like view
		- Sometimes the cursor floats on the right
	- Improve fzf
		- Optimize :Files and :History for file-paths like nixprime/cpsm
		- Open in current window to be easy on the eyes
		- Report bug: sometimes text is scrolled out of view
	- Apply "recognize over recall" principle everywhere
		- Learn to use fzf with custom lists
	- Make opening entries in dirvish and quickfix (and nerdtree) consistent
	- Add pseewald/vim-anyfold
	- Add andymass/vim-matchup
	- Add ability to easily do a project-wide search, followed by a project-wide replace
	- Create mapping "sub-modes"
	- Add a scrollbar
	- Show search index (google/vim-searchindex)
	- Display better folding text

Improve IDE experience
================================================
	- Add on-the-fly linting
	- Add Emmet for writing HTML
	- Add REPL support
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
	- Add debugger integrations
	- Add code "table of contents" with tagbar
	- Add snippets
	- Add Language Server Protocol enhancements (WAIT FOR NEOVIM SUPPORT)
		- Code navigation (go to definition, go to parent function, find inheriting
		  functions, go to uses, etc.)
	- Perfect syntax highlighting via new syntax API (WAIT FOR NEOVIM SUPPORT)
	- Add as-you-type code completion (WAIT FOR NEOVIM SUPPORT)

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
	- Add ability to do GTD
