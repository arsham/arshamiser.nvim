local internals = function(palette) -- Internals {{{
  return {
    Normal = { -- {{{
      guifg = palette.white,
      guibg = palette.base0,
    },
    NormalNC = {
      -- normal text in non-current windows
      guifg = palette.white,
      guibg = palette.base0,
    },
    NormalSB = {
      -- normal text in non-current windows
      guifg = palette.white,
      guibg = palette.sidebar_bg,
    },
    NormalFloat = {
      -- normal text and background color for floating windows
      guifg = palette.grey_light,
      guibg = palette.base4,
    }, -- }}}
    Pmenu = { --{{{
      -- Popup menu: normal item.
      guifg = palette.grey_light,
      guibg = palette.base4,
    },
    PmenuSel = {
      -- Popup menu: selected item.
      guifg = palette.base4,
      guibg = palette.blue_pale,
    },
    PmenuSelBold = {
      guifg = palette.base4,
      guibg = palette.blue_pale,
    },
    PmenuThumb = {
      -- Popup menu: Thumb of the scrollbar.
      guifg = palette.purple,
      guibg = palette.green,
    },
    PmenuSbar = {
      -- Popup menu: scrollbar.
      guifg = palette.none,
      guibg = palette.base3,
    }, --}}}
    Cursor = { --{{{
      guifg = palette.none,
      guibg = palette.none,
      style = palette.reverse,
    },
    ColorColumn = {
      --  used for the columns set with 'colorcolumn'
      guifg = palette.none,
      guibg = palette.color_column,
    },
    CursorLine = {
      -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority
      -- if foreground (ctermfg OR guifg) is not set.
      guifg = palette.none,
      guibg = palette.base3,
    },
    ToolbarLine = {
      guifg = palette.white,
      guibg = palette.base3,
    },
    ToolbarButton = {
      guifg = palette.white,
      guibg = palette.none,
      style = palette.bold,
    }, --}}}
    NormalMode = { --{{{
      -- Normal mode message in the cmdline
      guifg = palette.accent,
      guibg = palette.none,
      style = palette.reverse,
    },
    InsertMode = {
      -- Insert mode message in the cmdline
      guifg = palette.green,
      guibg = palette.none,
      style = palette.reverse,
    },
    ReplacelMode = {
      -- Replace mode message in the cmdline
      guifg = palette.red,
      guibg = palette.none,
      style = palette.reverse,
    },
    VisualMode = {
      -- Visual mode message in the cmdline
      guifg = palette.purple,
      guibg = palette.none,
      style = palette.reverse,
    },
    CommandMode = {
      -- Command mode message in the cmdline
      guifg = palette.grey,
      guibg = palette.none,
      style = palette.reverse,
    }, --}}}
    healthError = { --{{{
      guifg = palette.error,
    },
    healthSuccess = {
      guifg = palette.green,
    },
    healthWarning = {
      guifg = palette.yellow,
    },
    Warnings = {
      guifg = palette.yellow,
    },
    NonText = {
      -- '@' at the end of the window, characters from 'showbreak' and other
      -- characters that do not really exist in the text (e.g., ">" displayed
      -- when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      guifg = palette.base5,
    }, --}}}
    Visual = { --{{{
      -- Visual mode selection
      guibg = palette.base5,
    },
    VisualNOS = {
      -- Visual mode selection when vim is "Not Owning the Selection".
      guibg = palette.base3,
    },
    Substitute = {
      -- |:substitute| replacement text highlighting
      guibg = palette.red,
      guifg = palette.black,
    },
    StatusLine = {
      -- status line of current window
      guifg = palette.base7,
      guibg = palette.base2,
      style = palette.none,
    },
    Search = {
      -- Last search pattern highlighting (see 'hlsearch').  Also used for
      -- similar items that need to stand out.
      guifg = palette.base0,
      guibg = palette.accent,
      style = palette.bold,
    },
    IncSearch = {
      -- 'incsearch' highlighting; also used for the text replaced with
      -- ":s///c"
      guifg = palette.base2,
      guibg = palette.yellow,
    }, --}}}
    CursorLineNr = { --{{{
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the
      -- cursor line.
      guifg = palette.orange,
      guibg = palette.base2,
    },
    MatchParen = {
      -- The character under the cursor or just before it, if it is a paired
      -- bracket, and its match. |pi_paren.txt|
      guifg = palette.pink,
      guibg = palette.none,
    },
    Question = {
      -- |hit-enter| prompt and yes/no questions
      guifg = palette.yellow,
    }, --}}}
    ModeMsg = { --{{{
      -- 'showmode' message (e.g., "-- INSERT -- ")
      guifg = palette.white,
      guibg = palette.none,
      style = palette.bold,
    },
    MsgArea = {
      -- Area for messages and cmdline
      guifg = palette.fg_dark,
    },
    MoreMsg = {
      -- |more-prompt|
      guifg = palette.white,
      guibg = palette.none,
      style = palette.bold,
    },
    ErrorMsg = {
      -- error messages
      guifg = palette.red,
      guibg = palette.none,
      style = palette.bold,
    },
    WarningMsg = {
      -- warning messages
      guifg = palette.yellow,
      guibg = palette.none,
      style = palette.bold,
    }, --}}}
    VertSplit = { --{{{
      guifg = palette.blue_pale,
      guibg = palette.base0,
    },
    LineNr = {
      guifg = palette.base6,
      guibg = palette.base2,
    },
    SignColumn = {
      guifg = palette.base5,
      guibg = palette.base2,
    },
    SignColumnSB = {
      -- column where |signs| are displayed
      guibg = palette.sidebar_bg,
      guifg = palette.white,
    }, --}}}
    StatusLineNC = { --{{{
      -- status lines of not-current windows Note: if this is equal to
      -- "StatusLine" Vim will use "^^^" in the status line of the current
      -- window.
      guifg = palette.grey,
      guibg = palette.base2,
      style = palette.none,
    },
    StatusLineTerm = {
      -- status line of current terminal window
      guifg = palette.white,
      guibg = palette.active,
    },
    StatusLineTermNC = {
      -- status lines of not-current terminal windows Note: if this is equal
      -- to "StatusLine" Vim will use "^^^" in the status line of the current
      -- window.
      guifg = palette.text,
      guibg = palette.base0,
    },
    TabLine = {
      -- tab pages line, not active tab page label
      guibg = palette.blue_dark,
      guifg = palette.blue_pale,
      style = palette.none,
    },
    TabLineFill = {
      -- tab pages line, where there are no labels
      guibg = palette.base0,
      guifg = palette.base4,
      style = palette.none,
    },
    TabLineSel = {
      -- tab pages line, active tab page label
      guibg = palette.blue_pale,
      guifg = palette.white,
      style = palette.bold,
    },
    Title = {
      -- titles for output from ":set all", ":autocmd" etc.
      guifg = palette.yellow,
      style = palette.bold,
    }, --}}}
    SpellBad = { --{{{
      -- Word that is not recognized by the spellchecker. |spell| Combined
      -- with the highlighting used otherwise.
      guifg = palette.red,
      guibg = palette.none,
      style = palette.undercurl,
    },
    SpellCap = {
      -- Word that should start with a capital. |spell| Combined with the
      -- highlighting used otherwise.
      guifg = palette.purple,
      guibg = palette.none,
      style = palette.undercurl,
    },
    SpellRare = {
      -- Word that is recognized by the spellchecker as one that is hardly
      -- ever used.  |spell| Combined with the highlighting used otherwise.
      guifg = palette.aqua,
      guibg = palette.none,
      style = palette.undercurl,
    },
    SpellLocal = {
      -- Word that is recognized by the spellchecker as one that is used in
      -- another region. |spell| Combined with the highlighting used
      -- otherwise.
      guifg = palette.pink,
      guibg = palette.none,
      style = palette.undercurl,
    }, --}}}
    DiffAdd = { -- {{{
      -- diff mode: Added line
      guifg = palette.diff_add_fg,
      guibg = palette.diff_add_bg,
    },
    DiffDelete = {
      -- diff mode: Deleted line
      guifg = palette.diff_remove_fg,
      guibg = palette.diff_remove_bg,
    },
    DiffChange = {
      --  diff mode: Changed line
      guifg = palette.diff_change_fg,
      guibg = palette.diff_change_bg,
    },
    DiffText = {
      -- diff mode: Changed text within a changed line
      guifg = palette.diff_text_fg,
      guibg = palette.diff_text_bg,
    },
    diffAdded = {
      guifg = palette.green,
    },
    diffRemoved = {
      guifg = palette.pink,
    },
    diffChanged = {
      guifg = palette.blue,
    },
    diffOldFile = {
      guifg = palette.text,
    },
    diffNewFile = {
      guifg = palette.title,
    },
    diffFile = {
      guifg = palette.grey,
    },
    diffLine = {
      guifg = palette.cyan,
    },
    diffIndexLine = {
      guifg = palette.purple,
    },
    -- }}}
    Folded = { --{{{
      -- line used for closed folds
      guifg = palette.border,
      guibg = palette.base3,
    },
    FoldColumn = {
      -- 'foldcolumn'
      guifg = palette.border,
      guibg = palette.base2,
    },
    Constant = {
      guifg = palette.aqua,
    },
    Number = {
      guifg = palette.purple,
    },
    Float = {
      guifg = palette.purple,
    },
    Boolean = {
      -- a boolean constant: TRUE, false
      guifg = palette.purple,
    },
    Character = {
      guifg = palette.yellow,
    },
    String = {
      guifg = palette.yellow,
    },
    Type = {
      -- int, long, char, etc.
      guifg = palette.aqua,
    },
    Structure = {
      -- struct, union, enum, etc.
      guifg = palette.aqua,
    },
    StorageClass = {
      -- static, register, volatile, etc.
      guifg = palette.aqua,
    },
    Typedef = {
      -- A typedef
      guifg = palette.aqua,
    },
    Identifier = {
      guifg = palette.white,
    },
    Function = {
      guifg = palette.green,
    },
    Statement = {
      -- any statement
      guifg = palette.pink,
    },
    Operator = {
      guifg = palette.pink,
    },
    Label = {
      -- case, default, etc.
      guifg = palette.pink,
    },
    Keyword = {
      guifg = palette.pink,
    },
    PreProc = {
      -- generic Preprocessor
      guifg = palette.green,
    },
    Include = {
      -- preprocessor #include
      guifg = palette.pink,
    },
    Define = {
      -- preprocessor #define
      guifg = palette.pink,
    },
    Macro = {
      -- same as Define
      guifg = palette.pink,
    },
    PreCondit = {
      -- preprocessor #if, #else, #endif, etc.
      guifg = palette.pink,
    }, --}}}
    Special = { --{{{
      -- any special symbol
      guifg = palette.white,
    },
    SpecialChar = {
      -- special character in a constant
      guifg = palette.pink,
    },
    SpecialKey = {
      -- Unprintable characters: text displayed differently from what it
      -- really is.  But not 'listchars' whitespace. |hl-Whitespace|
      guifg = palette.pink,
    },
    Delimiter = {
      guifg = palette.white,
    },
    SpecialComment = {
      -- special things inside a comment
      guifg = palette.grey,
    },
    Tag = {
      -- you can use CTRL-] on this
      guifg = palette.orange,
    },
    Todo = {
      -- anything that needs extra attention; mostly the keywords TODO FIXME
      -- and XXX
      guifg = palette.orange,
      guibg = palette.none,
      style = palette.bold_italic,
    },
    Comment = {
      guifg = palette.base6,
    },
    Underlined = {
      -- text that stands out, HTML links
      guifg = palette.none,
      style = palette.underline,
    },
    Bold = {
      style = palette.bold,
    },
    Italic = {
      style = palette.italic,
    },
    Ignore = {
      -- left blank, hidden
      guifg = palette.none,
    },
    Error = {
      -- any erroneous construct
      guifg = palette.red,
    },
    Terminal = {
      guifg = palette.white,
      guibg = palette.base2,
    },
    EndOfBuffer = {
      guifg = palette.base2,
      guibg = palette.none,
    },
    Conceal = {
      -- placeholder characters substituted for concealed text (see
      -- 'conceallevel')
      guifg = palette.grey,
      guibg = palette.none,
    }, --}}}
    vCursor = { --{{{
      -- the character under the cursor
      guifg = palette.none,
      guibg = palette.none,
      style = palette.reverse,
    },
    iCursor = {
      guifg = palette.none,
      guibg = palette.none,
      style = palette.reverse,
    },
    lCursor = {
      guifg = palette.none,
      guibg = palette.none,
      style = palette.reverse,
    },
    CursorIM = {
      -- like Cursor, but used when in IME mode
      guifg = palette.none,
      guibg = palette.none,
      style = palette.reverse,
    },
    CursorColumn = {
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      guifg = palette.none,
      guibg = palette.base3,
    },
    WildMenu = {
      -- current match in 'wildmenu' completion
      guifg = palette.white,
      guibg = palette.orange,
    },
    QuickFixLine = {
      -- Current |quickfix| item in the quickfix window. Combined with
      -- |hl-CursorLine| when the cursor is there.
      guifg = palette.purple,
      style = palette.bold,
    }, --}}}
    qfLineNr = { --{{{
      -- Line numbers for quickfix lists
      guifg = palette.highlight,
      guibg = palette.title,
      style = palette.reverse,
    },
    qfFileName = {
      guifg = palette.blue,
    },
    Debug = {
      -- debugging statements
      guifg = palette.orange,
    },
    debugBreakpoint = {
      guifg = palette.base2,
      guibg = palette.red,
    },
    htmlLink = {
      guifg = palette.link,
      style = palette.underline,
    },
    htmlH1 = {
      guifg = palette.cyan,
      style = palette.bold,
    },
    htmlH2 = {
      guifg = palette.red,
      style = palette.bold,
    },
    mkdCodeDelimiter = {
      guibg = palette.terminal_black,
      guifg = palette.white,
    },
    mkdCodeStart = {
      guifg = palette.teal,
      style = palette.bold,
    },
    mkdCodeEnd = {
      guifg = palette.teal,
      style = palette.bold,
    },
    markdownHeadingDelimiter = {
      guifg = palette.orange,
      style = palette.bold,
    },
    markdownCode = {
      guifg = palette.teal,
    },
    markdownCodeBlock = {
      guifg = palette.teal,
    },
    htmlH3 = {
      guifg = palette.green,
      style = palette.bold,
    },
    htmlH4 = {
      guifg = palette.yellow,
      style = palette.bold,
    },
    htmlH5 = {
      guifg = palette.purple,
      style = palette.bold,
    },
    markdownH1 = {
      guifg = palette.cyan,
      style = palette.bold,
    },
    markdownH2 = {
      guifg = palette.red,
      style = palette.bold,
    },
    markdownLinkText = {
      guifg = palette.blue,
      style = palette.underline,
    },
    debugPC = {
      guibg = palette.sidebar_bg,
    }, -- used for highlighting the current line in terminal-debug
    markdownH3 = {
      guifg = palette.green,
      style = palette.bold,
    },
    markdownH1Delimiter = {
      -- character that needs attention like , or .
      guifg = palette.cyan,
    },
    markdownH2Delimiter = {
      guifg = palette.red,
    },
    markdownH3Delimiter = {
      guifg = palette.green,
    }, --}}}
    Conditional = { --{{{
      guifg = palette.pink,
    },
    Directory = {
      -- directory names (and other special names in listings)
      guifg = palette.aqua,
      guibg = palette.none,
    },
    Repeat = {
      guifg = palette.pink,
    },
    Exception = {
      guifg = palette.pink,
    },
    Whitespace = {
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      guifg = palette.base3,
    },
    ExtraWhitespace = {
      guifg = palette.base1,
      guibg = palette.diff_add_fg,
    }, --}}}
    -- Help {{{
    helpHyperTextJump = {
      link = "Statement",
    },
    --}}}
  }
end
-- }}}

local plugin_syntax = function(palette) -- Plugins {{{
  return {
    -- Treesitter {{{
    TSString = {
      guifg = palette.yellow,
    },
    TSStringRegex = {
      -- For regexes.
      guifg = palette.purple,
    },
    TSStringEscape = {
      -- For escape characters within a string.
      guifg = palette.purple,
    },
    TSInclude = {
      -- For includes: `#include` in C, `use` or `extern crate` in Rust, or
      -- `require` in Lua.
      guifg = palette.pink,
    },
    TSVariable = {
      guifg = palette.white,
    },
    TSVariableBuiltin = {
      guifg = palette.orange,
    },
    TSAnnotation = {
      -- For C++/Dart attributes, annotations that can be attached to the
      -- code to denote some kind of meta information.
      guifg = palette.green,
    },
    TSAttribute = {
      guifg = palette.yellow,
    },
    TSBoolean = {
      -- For booleans.
      guifg = palette.orange,
    },
    TSComment = {
      guifg = palette.base6,
    },
    TSConstant = {
      guifg = palette.aqua,
    },
    TSConstBuiltin = {
      -- For constant that are built in the language: `nil` in Lua.
      guifg = palette.orange,
    },
    TSConstMacro = {
      -- For constants that are defined by macros: `NULL` in C.
      guifg = palette.purple,
    },
    TSError = {
      -- For syntax/parser errors.
      guifg = palette.error,
    },
    TSConditional = {
      guifg = palette.pink,
    },
    TSCharacter = {
      -- For characters.
      -- any character constant: 'c', '\n'
      guifg = palette.yellow,
    },
    TSConstructor = {
      -- For constructor calls and definitions: `= { }` in Lua, and Java
      -- constructors.
      guifg = palette.purple,
    },
    TSFunction = {
      guifg = palette.green,
    },
    TSFuncBuiltin = {
      guifg = palette.aqua,
    },
    TSFuncMacro = {
      -- For macro defined fuctions (calls and definitions): each
      -- `macro_rules` in Rust.
      guifg = palette.green,
    },
    TSKeyword = {
      guifg = palette.pink,
    },
    TSKeywordFunction = {
      guifg = palette.pink,
    },
    TSKeywordOperator = {
      -- sizeof", "+", "*", etc.
      guifg = palette.pink,
    },
    TSKeywordReturn = {
      guifg = palette.pink,
    },
    TSMethod = {
      guifg = palette.green,
    },
    TSNamespace = {
      -- For identifiers referring to modules and namespaces.
      guifg = palette.purple,
    },
    TSNumber = {
      guifg = palette.purple,
    },
    TSOperator = {
      -- For any operator: `+`, but also `->` and `*` in C.
      guifg = palette.pink,
    },
    TSParameter = {
      -- For parameters of a function.
      guifg = palette.white,
    },
    TSParameterReference = {
      -- For references to parameters of a function.
      guifg = palette.white,
    },
    TSProperty = {
      -- Same as `TSField`,accesing for struct members in C.
      guifg = palette.green,
    },
    TSPunctDelimiter = {
      -- For delimiters ie: `.`
      guifg = palette.white,
    },
    TSPunctBracket = {
      -- For brackets and parens.
      guifg = palette.white,
    },
    TSPunctSpecial = {
      -- For special punctutation that does not fall in the catagories
      -- before.
      guifg = palette.pink,
    },
    TSRepeat = {
      guifg = palette.pink,
    },
    TSSymbol = {
      -- For identifiers referring to symbols or atoms.
      guifg = palette.yellow,
    },
    TSTag = {
      -- Tags like html tag names.
      guifg = palette.pink,
    },
    TSTagDelimiter = {
      -- Tag delimiter like `<` `>` `/`
      guifg = palette.white,
    },
    TSText = {
      -- For strings considered text in a markup language.
      guifg = palette.text,
    },
    TSTextReference = {
      guifg = palette.yellow,
    },
    TSEmphasis = {
      -- For text to be represented with emphasis.
      guifg = palette.blue_pale,
    },
    TSUnderline = {
      -- For text to be represented with an underline.
      guifg = palette.white,
      guibg = palette.none,
      style = palette.underline,
    },
    TSTitle = {
      -- Text that is part of a title.
      guifg = palette.title,
      guibg = palette.none,
      style = palette.bold,
    },
    TSLiteral = {
      -- Literal text.
      guifg = palette.white,
    },
    TSURI = {
      -- Any URI like a link or email.
      guifg = palette.link,
    },
    TSTagAttribute = {
      guifg = palette.green,
    },
    TSLabel = {
      -- For labels: `label:` in C and `:label:` in Lua.
      guifg = palette.pink,
    },
    TSType = {
      -- For types.
      guifg = palette.aqua,
    },
    TSTypeBuiltin = {
      -- For builtin types.
      guifg = palette.purple,
    },
    TSException = {
      -- For exception related keywords.  try, catch, throw
      guifg = palette.pink,
    },
    TSField = {
      -- For fields.
      guifg = palette.white,
    },
    TSFloat = {
      guifg = palette.purple,
    },
    TSNote = {
      guifg = palette.orange,
      guibg = palette.info,
      style = palette.bold,
    },
    TSWarning = {
      -- TODO, HACK, WARNING
      guifg = palette.black,
      guibg = palette.warning,
      style = palette.bold,
    },
    TSDanger = {
      -- FIXME, XXX, BUG
      guifg = palette.black,
      guibg = palette.error,
      style = palette.bold,
    },
    TSDefinitionUsage = {
      guibg = palette.base5,
    },
    TSDefinition = {
      guibg = palette.base5,
    },
    -- }}}
    -- LSP {{{
    LspDiagnosticsDefaultError = {
      -- used for "Error" diagnostic virtual text
      guifg = palette.error,
    },
    LspDiagnosticsError = {
      guifg = palette.error,
    },
    LspDiagnosticsWarning = {
      guifg = palette.yellow,
    },
    LspDiagnosticsInformation = {
      guifg = palette.blue_pale,
    },
    LspDiagnosticsHint = {
      guifg = palette.purple,
    },
    LspDiagnosticsSignError = {
      -- used for "Error" diagnostic signs in sign column
      guifg = palette.red,
      guibg = palette.base2,
    },
    LspDiagnosticsFloatingError = {
      -- used for "Error" diagnostic messages in the diagnostics float
      guifg = palette.error,
    },
    LspDiagnosticsSignWarning = {
      -- used for "Warning" diagnostic signs in sign column
      guifg = palette.yellow,
      guibg = palette.base2,
    },
    LspDiagnosticsFloatingWarning = {
      -- used for "Warning" diagnostic messages in the diagnostics float
      guifg = palette.yellow,
    },
    LspDiagnosticsSignInformation = {
      -- used for "Information" diagnostic signs in sign column
      guibg = palette.base2,
      guifg = palette.white,
    },
    LspDiagnosticsFloatingInformation = {
      -- used for "Information" diagnostic messages in the diagnostics float
      guifg = palette.blue_pale,
    },
    LspDiagnosticsSignHint = {
      -- used for "Hint" diagnostic signs in sign column
      guifg = palette.aqua,
      guibg = palette.base2,
    },
    LspDiagnosticsFloatingHint = {
      -- used for "Hint" diagnostic messages in the diagnostics float
      guifg = palette.purple,
    },
    LspDiagnosticsVirtualTextError = {
      -- Virtual text "Error"
      guifg = palette.red,
    },
    LspDiagnosticsVirtualTextWarning = {
      -- Virtual text "Warning"
      guifg = palette.yellow,
    },
    LspDiagnosticsVirtualTextInformation = {
      -- Virtual text "Information"
      guifg = palette.white,
    },
    LspDiagnosticsVirtualTextHint = {
      -- Virtual text "Hint"
      guifg = palette.aqua,
    },
    LspDiagnosticsUnderlineError = {
      -- used to underline "Error" diagnostics.
      -- style = palette.undercurl,
      guisp = palette.red,
    },
    LspDiagnosticsDefaultWarning = {
      -- used for "Warning" diagnostic signs in sign column
      guifg = palette.yellow,
    },
    LspDiagnosticsUnderlineWarning = {
      -- used to underline "Warning" diagnostics.
      -- style = palette.undercurl,
      guisp = palette.yellow,
    },
    LspDiagnosticsDefaultInformation = {
      -- used for "Information" diagnostic virtual text
      guifg = palette.blue_pale,
    },
    LspDiagnosticsUnderlineInformation = {
      -- used to underline "Information" diagnostics.
      -- style = palette.undercurl,
      guisp = palette.white,
    },
    LspDiagnosticsDefaultHint = {
      -- used for "Hint" diagnostic virtual text
      guifg = palette.purple,
    },
    LspDiagnosticsUnderlineHint = {
      -- used to underline "Hint" diagnostics.
      -- style = palette.undercurl,
      guisp = palette.aqua,
    },
    LspSignatureActiveParameter = {
      guifg = palette.orange,
    },
    LspCodeLens = {
      guifg = palette.orange,
    },
    LspFloatWinNormal = {
      guibg = palette.blue_pale,
    },
    LspFloatWinBorder = {
      guifg = palette.border_highlight,
    },
    LspSagaBorderTitle = {
      guifg = palette.cyan,
    },
    LspSagaHoverBorder = {
      guifg = palette.blue,
    },
    LspSagaRenameBorder = {
      guifg = palette.green,
    },
    LspSagaDefPreviewBorder = {
      guifg = palette.green,
    },
    LspSagaCodeActionBorder = {
      guifg = palette.blue,
    },
    LspSagaFinderSelection = {
      guifg = palette.bg_visual,
    },
    LspSagaCodeActionTitle = {
      guifg = palette.blue1,
    },
    LspSagaCodeActionContent = {
      guifg = palette.purple,
    },
    LspSagaSignatureHelpBorder = {
      guifg = palette.red,
    },
    LspLinesDiagBorder = {
      guifg = palette.contrast,
    },
    LspReferenceText = {
      -- used for highlighting "text" references
      guifg = palette.accent,
      guibg = palette.highlight,
    },
    LspReferenceRead = {
      -- used for highlighting "read" references
      guifg = palette.accent,
      guibg = palette.highlight,
    },
    LspReferenceWrite = {
      -- used for highlighting "write" references
      guifg = palette.accent,
      guibg = palette.highlight,
    },
    LspTroubleText = {
      guifg = palette.text,
    },
    LspTroubleCount = {
      guifg = palette.purple,
      guibg = palette.active,
    },
    LspTroubleNormal = {
      guifg = palette.white,
      guibg = palette.sidebar,
    },
    -- }}}
    -- Diagnostics {{{
    DiagnosticError = {
      guifg = palette.error,
    },
    DiagnosticLineNrError = {
      guifg = palette.base4,
      guibg = palette.error,
    },
    DiagnosticWarning = {
      guifg = palette.warning,
    },
    DiagnosticLineNrWarn = {
      guifg = palette.base4,
      guibg = palette.warning,
    },
    DiagnosticInformation = {
      guifg = palette.green,
    },
    DiagnosticLineNrInfo = {
      guifg = palette.base4,
      guibg = palette.green,
    },
    DiagnosticHint = {
      guifg = palette.blue_pale,
    },
    DiagnosticLineNrHint = {
      guifg = palette.base4,
      guibg = palette.blue_pale,
    },
    -- }}}
    -- ALE {{{
    ALEErrorSign = {
      guifg = palette.error,
      guibg = palette.base2,
    },
    ALEStyleErrorSign = {
      guifg = palette.error,
      guibg = palette.base2,
    },
    ALEWarningSign = {
      guifg = palette.warning,
      guibg = palette.base2,
    },
    ALEStyleWarningSign = {
      guifg = palette.warning,
      guibg = palette.base2,
    },
    ALEInfoSign = {
      guifg = palette.green,
      guibg = palette.base2,
    },
    ALEDummySign = {
      guifg = palette.blue_pale,
      guibg = palette.base2,
    },
    -- }}}
    -- Misc {{{
    illuminatedWord = {
      guibg = palette.white,
    },
    illuminatedCurWord = {
      guibg = palette.white,
    },
    CursorWord0 = {
      guibg = palette.white,
      guifg = palette.black,
    },
    CursorWord1 = {
      guibg = palette.white,
      guifg = palette.black,
    },
    -- }}}
    -- Nvim-Tree {{{
    NvimTreeFolderName = {
      guifg = palette.white,
    },
    NvimTreeFolderIcon = {
      guifg = palette.accent,
    },
    NvimTreeEmptyFolderName = {
      guifg = palette.disabled,
    },
    NvimTreeOpenedFolderName = {
      guifg = palette.accent,
      style = palette.italic,
    },
    NvimTreeIndentMarker = {
      guifg = palette.disabled,
    },
    NvimTreeGitDirty = {
      guifg = palette.blue,
    },
    NvimTreeGitNew = {
      guifg = palette.green,
    },
    NvimTreeGitStaged = {
      guifg = palette.comments,
    },
    NvimTreeGitDeleted = {
      guifg = palette.red,
    },
    NvimTreeOpenedFile = {
      guifg = palette.accent,
    },
    NvimTreeImageFile = {
      guifg = palette.yellow,
    },
    NvimTreeMarkdownFile = {
      guifg = palette.pink,
    },
    NvimTreeExecFile = {
      guifg = palette.green,
    },
    NvimTreeRootFolder = {
      guifg = palette.pink,
    },
    NvimTreeSpecialFile = {
      guifg = palette.white,
      guibg = palette.none,
      style = palette.none,
    },
    NvimTreeNormal = {
      guifg = palette.white,
      guibg = palette.sidebar_bg,
    },
    -- }}}
    -- Git Signs {{{
    GitSignsAdd = {
      guifg = palette.diff_add_bg,
      guibg = palette.base2,
    },
    GitSignsAddNr = {
      guifg = palette.diff_add_bg,
      guibg = palette.base2,
    },
    GitSignsAddInline = {
      guifg = palette.diff_add_bg,
      guibg = palette.base2,
    },
    GitSignsAddLnInline = {
      guifg = palette.diff_add_bg,
      guibg = palette.base2,
    },
    GitSignsAddVirtLnInline = {
      guifg = palette.diff_add_bg,
      guibg = palette.base2,
    },
    GitSignsChange = {
      guifg = palette.diff_change_bg,
      guibg = palette.base2,
    },
    GitSignsChangeNr = {
      guifg = palette.diff_change_bg,
      guibg = palette.base2,
    },
    GitSignsChangeInLine = {
      guifg = palette.diff_change_bg,
      guibg = palette.base2,
    },
    GitSignsChangeVirtLnInline = {
      guifg = palette.diff_change_bg,
      guibg = palette.base2,
    },
    GitSignsChangeLnInline = {
      guifg = palette.diff_change_bg,
      guibg = palette.base2,
    },
    GitSignsDelete = {
      guifg = palette.diff_remove_bg,
      guibg = palette.base2,
    },
    GitSignsDeleteNr = {
      guifg = palette.diff_remove_bg,
      guibg = palette.base2,
    },
    GitSignsDeleteInLine = {
      guifg = palette.diff_remove_bg,
      guibg = palette.base2,
    },
    GitSignsDeleteLnInline = {
      guifg = palette.diff_remove_bg,
      guibg = palette.base2,
    },
    GitSignsDeleteVirtLnInline = {
      guifg = palette.diff_remove_bg,
      guibg = palette.base2,
    },
    -- }}}
    -- Notifications {{{
    NotifyERRORBorder = {
      guifg = palette.error,
    },
    NotifyWARNBorder = {
      guifg = palette.warning,
    },
    NotifyINFOBorder = {
      guifg = palette.green,
    },
    NotifyDEBUGBorder = {
      guifg = palette.grey,
    },
    NotifyTRACEBorder = {
      guifg = palette.pink,
    },
    NotifyERRORIcon = {
      guifg = palette.error,
    },
    NotifyWARNIcon = {
      guifg = palette.warning,
    },
    NotifyINFOIcon = {
      guifg = palette.green,
    },
    NotifyDEBUGIcon = {
      guifg = palette.grey,
    },
    NotifyTRACEIcon = {
      guifg = palette.pink,
    },
    NotifyERRORTitle = {
      guifg = palette.error,
    },
    NotifyWARNTitle = {
      guifg = palette.warning,
    },
    NotifyINFOTitle = {
      guifg = palette.green,
    },
    NotifyDEBUGTitle = {
      guifg = palette.grey,
    },
    NotifyTRACETitle = {
      guifg = palette.pink,
    },
    -- }}}
    FidgetTitle = {
      guifg = palette.blue_pale,
    },
    FidgetTask = {
      guifg = palette.green,
    },
  }
end
-- }}}

-- Setup function {{{
local nvim = require("nvim")

---Creates all highlighting from the given palette.
---@param palette string could be 'light_palette' or 'dark_palette'
---@param name string the colour scheme name
local setup = function(palette, name) --{{{
  nvim.ex.clear()
  if vim.fn.exists("syntax_on") then
    nvim.ex.syntax("reset")
  end

  local quick = require("arshlib.quick")
  vim.g.colors_name = name
  for group, colors in pairs(internals(palette)) do
    quick.highlight(group, colors)
  end
  local async_load_plugin = nil
  async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
    for group, colors in pairs(plugin_syntax(palette)) do
      quick.highlight(group, colors)
    end
    async_load_plugin:close()
  end))
  async_load_plugin:send()
end --}}}

return {
  setup = setup,
}
-- }}}

-- vim: fdm=marker fdl=1
