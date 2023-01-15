local internals = function(palette) -- Internals {{{
  return {
    Normal = { -- {{{
      fg = palette.white,
      bg = palette.base0,
    },
    NormalNC = {
      -- normal text in non-current windows
      fg = palette.white,
      bg = palette.base0,
    },
    NormalSB = {
      -- normal text in non-current windows
      fg = palette.white,
      bg = palette.sidebar_bg,
    },
    NormalFloat = {
      -- normal text and background color for floating windows
      bg = palette.pmenu,
    },
    -- }}}
    Pmenu = { -- {{{
      -- Popup menu: normal item.
      bg = palette.pmenu,
    },
    PmenuSel = {
      -- Popup menu: selected item.
      fg = palette.pmenu,
      bg = palette.blue_pale,
      bold = true,
    },
    PmenuSelBold = {
      fg = palette.base4,
      bg = palette.blue_pale,
    },
    PmenuThumb = {
      -- Popup menu: Thumb of the scrollbar.
      fg = palette.purple,
      bg = palette.blue_light,
    },
    PmenuSbar = {
      -- Popup menu: scrollbar.
      fg = palette.none,
      bg = palette.base3,
    },
    -- }}}
    Cursor = { -- {{{
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    lCursor = {
      -- the character under the cursor when language-mapping is used.
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    vCursor = {
      -- the character under the cursor
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    iCursor = {
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    TermCursor = {
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    TermCursorNC = {
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    CursorIM = {
      -- like Cursor, but used when in IME mode.
      fg = palette.none,
      bg = palette.none,
      reverse = true,
    },
    CursorColumn = {
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      fg = palette.none,
      bg = palette.base3,
    },
    ColorColumn = {
      --  used for the columns set with 'colorcolumn'
      fg = palette.none,
      bg = palette.color_column,
    },
    CursorLine = {
      -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority
      -- if foreground (ctermfg OR fg) is not set.
      bg = palette.base3,
    },
    -- }}}
    ToolbarLine = { -- {{{
      fg = palette.white,
      bg = palette.base3,
    },
    ToolbarButton = {
      fg = palette.white,
      bg = palette.none,
      bold = true,
    },
    -- }}}
    -- Modes {{{
    NormalMode = {
      -- Normal mode message in the cmdline
      fg = palette.accent,
      bg = palette.none,
      reverse = true,
    },
    InsertMode = {
      -- Insert mode message in the cmdline
      fg = palette.green,
      bg = palette.none,
      reverse = true,
    },
    ReplacelMode = {
      -- Replace mode message in the cmdline
      fg = palette.red,
      bg = palette.none,
      reverse = true,
    },
    VisualMode = {
      -- Visual mode message in the cmdline
      fg = palette.purple,
      bg = palette.none,
      reverse = true,
    },
    CommandMode = {
      -- Command mode message in the cmdline
      fg = palette.grey,
      bg = palette.none,
      reverse = true,
    },
    -- }}}
    -- Healthcheck {{{
    healthError = {
      fg = palette.error,
    },
    healthSuccess = {
      fg = palette.green,
    },
    healthWarning = {
      fg = palette.yellow,
    },
    -- }}}
    Visual = { -- {{{
      -- Visual mode selection
      bg = palette.base5,
    },
    VisualNOS = {
      -- Visual mode selection when vim is "Not Owning the Selection".
      bg = palette.base3,
    },
    Substitute = {
      -- |:substitute| replacement text highlighting
      bg = palette.red,
      fg = palette.black,
    },
    Search = {
      -- Last search pattern highlighting (see 'hlsearch').  Also used for
      -- similar items that need to stand out.
      fg = palette.base0,
      bg = palette.accent,
      bold = true,
    },
    IncSearch = {
      -- 'incsearch' highlighting; also used for the text replaced with
      -- ":s///c"
      fg = palette.base2,
      bg = palette.yellow,
    },
    Conceal = {
      -- placeholder characters substituted for concealed text (see
      -- 'conceallevel')
      fg = palette.grey,
    },
    Whitespace = {
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      fg = palette.base3,
    },
    ExtraWhitespace = {
      fg = palette.base1,
      bg = palette.diff_add_fg,
    },
    -- }}}
    CursorLineNr = { -- {{{
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the
      -- cursor line.
      fg = palette.orange,
      bg = palette.base2,
    },
    LineNr = {
      fg = palette.base6,
      bg = palette.base2,
    },
    -- }}}
    ModeMsg = { -- {{{
      -- 'showmode' message (e.g., "-- INSERT -- ")
      fg = palette.white,
      bg = palette.none,
      bold = true,
    },
    MsgArea = {
      -- Area for messages and cmdline
      fg = palette.fg_dark,
    },
    MoreMsg = {
      -- |more-prompt|
      fg = palette.white,
      bg = palette.none,
      bold = true,
    },
    ErrorMsg = {
      -- error messages
      fg = palette.red,
      bg = palette.none,
      bold = true,
    },
    MsgSeparator = {
      link = "StatusLine",
    },
    WarningMsg = {
      -- warning messages
      fg = palette.yellow,
      bg = palette.none,
      bold = true,
    },
    -- }}}
    VertSplit = { -- {{{
      fg = palette.blue_pale,
      bg = palette.base0,
    },
    -- }}}
    SignColumn = { -- {{{
      fg = palette.base5,
      bg = palette.base2,
    },
    SignColumnSB = {
      -- column where |signs| are displayed
      bg = palette.sidebar_bg,
      fg = palette.white,
    },
    EndOfBuffer = {
      -- filler lines (~) after the end of the buffer.
      fg = palette.base2,
      bg = palette.none,
    },
    -- }}}
    StatusLine = { -- {{{
      -- status line of current window
      fg = palette.base7,
      bg = palette.base2,
    },
    StatusLineNC = {
      -- status lines of not-current windows Note: if this is equal to
      -- "StatusLine" Vim will use "^^^" in the status line of the current
      -- window.
      fg = palette.grey,
      bg = palette.base2,
    },
    StatusLineTerm = {
      -- status line of current terminal window
      fg = palette.white,
      bg = palette.active,
    },
    StatusLineTermNC = {
      -- status lines of not-current terminal windows Note: if this is equal
      -- to "StatusLine" Vim will use "^^^" in the status line of the current
      -- window.
      fg = palette.text,
      bg = palette.base0,
    },
    Title = {
      -- titles for output from ":set all", ":autocmd" etc.
      fg = palette.yellow,
      bold = true,
    },
    -- }}}
    TabLine = { -- {{{
      -- tab pages line, not active tab page label
      bg = palette.blue_dark,
      fg = palette.grey_light,
    },
    TabLineFill = {
      -- tab pages line, where there are no labels
      bg = palette.base0,
      fg = palette.base4,
    },
    TabLineSel = {
      -- tab pages line, active tab page label
      bg = palette.blue_pale,
      fg = palette.white,
      bold = true,
    },
    TabLineSepSel = {
      bg = palette.blue_pale,
      fg = palette.base0,
    },
    TabLineSep = {
      bg = palette.blue_dark,
      fg = palette.base0,
    },
    TabLineModifiedSel = {
      bg = palette.blue_pale,
      fg = palette.white,
    },
    TabLineModified = {
      bg = palette.blue_dark,
      fg = palette.white,
    },
    -- }}}
    -- Spell check {{{
    SpellBad = {
      -- Word that is not recognized by the spellchecker. |spell| Combined
      -- with the highlighting used otherwise.
      fg = palette.red,
      bg = palette.none,
      undercurl = true,
      sp = palette.red,
    },
    SpellCap = {
      -- Word that should start with a capital. |spell| Combined with the
      -- highlighting used otherwise.
      fg = palette.purple,
      bg = palette.none,
      undercurl = true,
      sp = palette.purple,
    },
    SpellRare = {
      -- Word that is recognized by the spellchecker as one that is hardly
      -- ever used.  |spell| Combined with the highlighting used otherwise.
      fg = palette.aqua,
      bg = palette.none,
      undercurl = true,
      sp = palette.aqua,
    },
    SpellLocal = {
      -- Word that is recognized by the spellchecker as one that is used in
      -- another region. |spell| Combined with the highlighting used
      -- otherwise.
      fg = palette.pink,
      bg = palette.none,
      undercurl = true,
      sp = palette.pink,
    },
    --}}}
    -- Diff {{{
    DiffAdd = {
      -- diff mode: Added line
      bg = palette.diff_add_bg,
    },
    DiffDelete = {
      -- diff mode: Deleted line
      bg = palette.diff_remove_bg,
    },
    DiffChange = {
      --  diff mode: Changed line
      bg = palette.diff_change_bg,
    },
    DiffText = {
      -- diff mode: Changed text within a changed line
      bg = palette.diff_text_bg,
    },
    diffAdded = {
      fg = palette.green,
    },
    diffRemoved = {
      fg = palette.pink,
    },
    diffChanged = {
      fg = palette.blue,
    },
    diffOldFile = {
      fg = palette.text,
    },
    diffNewFile = {
      fg = palette.title,
    },
    diffFile = {
      fg = palette.grey,
    },
    diffLine = {
      fg = palette.cyan,
    },
    diffIndexLine = {
      fg = palette.purple,
    },
    -- }}}
    -- Folds {{{
    Folded = {
      -- line used for closed folds
      fg = palette.border,
      bg = palette.base3,
    },
    FoldColumn = {
      -- 'foldcolumn'
      fg = palette.border,
      bg = palette.base2,
    },
    -- }}}
    -- Language {{{
    Constructor = {
      -- For constructor calls and definitions: `= { }` in Lua, and Java
      -- constructors.
      fg = palette.purple,
    },
    Constant = {
      fg = palette.aqua,
    },
    Number = {
      fg = palette.purple,
    },
    Float = {
      fg = palette.purple,
    },
    Boolean = {
      -- a boolean constant: TRUE, false
      fg = palette.orange,
    },
    Enum = {
      fg = palette.orange,
    },
    Character = {
      -- For characters.
      -- any character constant: 'c', '\n'
      fg = palette.yellow,
    },
    String = {
      fg = palette.yellow,
    },
    Type = {
      -- int, long, char, etc.
      fg = palette.aqua,
    },
    Structure = {
      -- struct, union, enum, etc.
      fg = palette.aqua,
    },
    Struct = {
      link = "Structure",
    },
    StorageClass = {
      -- static, register, volatile, etc.
      fg = palette.aqua,
    },
    Typedef = {
      -- A typedef
      fg = palette.aqua,
    },
    Identifier = {
      fg = palette.white,
    },
    Namespace = {
      -- For identifiers referring to modules and namespaces.
      fg = palette.purple,
    },
    Field = {
      fg = palette.green,
    },
    Property = {
      fg = palette.green,
    },
    Function = {
      fg = palette.green,
    },
    Method = {
      fg = palette.aqua,
    },
    Statement = {
      -- any statement
      fg = palette.pink,
    },
    Operator = {
      fg = palette.pink,
    },
    Parameter = {
      fg = palette.yellow_light,
    },
    Label = {
      -- For labels: `label:` in C and `:label:` in Lua, case, default, etc.
      fg = palette.pink,
    },
    Keyword = {
      fg = palette.pink,
    },
    PreProc = {
      -- generic Preprocessor
      fg = palette.green,
    },
    Include = {
      -- For includes: `#include` in C, `use` or `extern crate` in Rust, or
      -- `require` in Lua.
      fg = palette.pink,
    },
    Define = {
      -- preprocessor #define
      fg = palette.pink,
    },
    Macro = {
      -- same as Define
      fg = palette.pink,
    },
    PreCondit = {
      -- preprocessor #if, #else, #endif, etc.
      fg = palette.pink,
    },
    Special = {
      -- any special symbol
      fg = palette.white,
    },
    SpecialChar = {
      -- special character in a constant
      fg = palette.purple,
    },
    SpecialKey = {
      -- Unprintable characters: text displayed differently from what it
      -- really is.  But not 'listchars' whitespace. |hl-Whitespace|
      fg = palette.pink,
    },
    Delimiter = {
      fg = palette.white,
    },
    SpecialComment = {
      -- special things inside a comment
      fg = palette.grey,
      bold = true,
    },
    Tag = {
      -- Tags like html tag names. you can use CTRL-] on this
      fg = palette.orange,
    },
    Todo = {
      -- anything that needs extra attention; mostly the keywords TODO FIXME
      -- and XXX
      fg = palette.orange,
      bg = palette.none,
      bold = true,
      italic = true,
    },
    Comment = {
      fg = palette.base6,
    },
    Underlined = {
      -- text that stands out, HTML links
      fg = palette.none,
      underline = true,
    },
    Bold = {
      bold = true,
    },
    Italic = {
      italic = true,
    },
    Ignore = {
      -- left blank, hidden
      fg = palette.none,
    },
    Error = {
      -- any erroneous construct
      fg = palette.error,
    },
    Warnings = {
      fg = palette.yellow,
    },
    Info = {
      fg = palette.info,
    },
    Hint = {
      fg = palette.hint,
    },
    Debug = {
      -- debugging statements
      fg = palette.orange,
    },
    debugBreakpoint = {
      fg = palette.base2,
      bg = palette.red,
    },
    Variable = {
      fg = palette.white,
    },
    Return = {
      fg = palette.pink,
    },
    NonText = {
      -- '@' at the end of the window, characters from 'showbreak' and other
      -- characters that do not really exist in the text (e.g., ">" displayed
      -- when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      fg = palette.base5,
    },
    Question = {
      -- |hit-enter| prompt and yes/no questions
      fg = palette.yellow,
    },
    Repeat = {
      fg = palette.pink,
    },
    Exception = {
      -- For exception related keywords.  try, catch, throw
      fg = palette.pink,
    },
    -- }}}
    Terminal = { -- {{{
      fg = palette.white,
      bg = palette.base2,
    },
    -- }}}
    WildMenu = { -- {{{
      -- current match in 'wildmenu' completion
      fg = palette.white,
      bg = palette.orange,
    },
    --}}}
    -- Quickfix {{{
    QuickFixLine = {
      -- Current |quickfix| item in the quickfix window. Combined with
      -- |hl-CursorLine| when the cursor is there.
      fg = palette.purple,
      bold = true,
    },
    qfLineNr = {
      -- Line numbers for quickfix lists
      fg = palette.highlight,
      bg = palette.title,
      reverse = true,
    },
    qfFileName = {
      fg = palette.blue,
    },
    -- }}}
    -- Markdown {{{
    htmlLink = {
      fg = palette.link,
      underline = true,
    },
    htmlH1 = {
      fg = palette.cyan,
      bold = true,
    },
    htmlH2 = {
      fg = palette.red,
      bold = true,
    },
    mkdCodeDelimiter = {
      bg = palette.terminal_black,
      fg = palette.white,
    },
    mkdCodeStart = {
      fg = palette.teal,
      bold = true,
    },
    mkdCodeEnd = {
      fg = palette.teal,
      bold = true,
    },
    markdownHeadingDelimiter = {
      fg = palette.orange,
      bold = true,
    },
    markdownCode = {
      fg = palette.teal,
    },
    markdownCodeBlock = {
      fg = palette.teal,
    },
    htmlH3 = {
      fg = palette.green,
      bold = true,
    },
    htmlH4 = {
      fg = palette.yellow,
      bold = true,
    },
    htmlH5 = {
      fg = palette.purple,
      bold = true,
    },
    markdownH1 = {
      fg = palette.cyan,
      bold = true,
    },
    markdownH2 = {
      fg = palette.red,
      bold = true,
    },
    markdownH3 = {
      fg = palette.green,
      bold = true,
    },
    markdownH4 = {
      link = "Title",
    },
    markdownH5 = {
      link = "Title",
    },
    markdownH6 = {
      link = "Title",
    },
    markdownLinkText = {
      fg = palette.blue,
      underline = true,
    },
    debugPC = {
      -- used for highlighting the current line in terminal-debug
      bg = palette.sidebar_bg,
    },
    markdownH1Delimiter = {
      -- character that needs attention like , or .
      fg = palette.cyan,
    },
    markdownH2Delimiter = {
      fg = palette.red,
    },
    markdownH3Delimiter = {
      fg = palette.green,
    },
    markdownBlockquote = {
      fg = palette.orange,
    },
    markdownBold = {
      fg = palette.blue,
      bold = true,
    },
    markdownItalic = {
      link = "Italic",
    },
    markdownBoldItalic = {
      fg = palette.yellow,
      bold = true,
      italic = true,
    },
    markdownCodeDelimiter = {
      fg = palette.orange,
    },
    markdownEscape = {
      fg = palette.yellow,
    },
    markdownFootnote = {
      fg = palette.orange,
    },
    markdownFootnoteDefinition = {
      fg = palette.orange,
    },
    markdownHeadingRule = {
      fg = palette.base0,
      bold = true,
    },
    markdownId = {
      link = "Identifier",
    },
    markdownIdDeclaration = {
      fg = palette.blue,
    },
    markdownIdDelimiter = {
      fg = palette.grey_light,
    },
    markdownLinkDelimiter = {
      fg = palette.grey_light,
    },
    markdownListMarker = {
      fg = palette.blue,
    },
    markdownOrderedListMarker = {
      fg = palette.purple,
    },
    markdownRule = {
      fg = palette.gray,
    },
    markdownUrl = {
      fg = palette.cyan,
      underdotted = true,
    },
    --}}}
    Conditional = { -- {{{
      fg = palette.pink,
    },
    Directory = {
      -- directory names (and other special names in listings)
      fg = palette.aqua,
    },
    --}}}
    -- Help {{{
    helpHyperTextJump = {
      link = "Statement",
    },
    -- }}}
  }
end
-- }}}

local plugin_syntax = function(palette) -- Plugins {{{
  return {
    -- Listish {{{
    ListishQfSign = {
      fg = palette.purple,
      bg = palette.base2,
    },
    ListishQfExt = {
      fg = palette.purple,
      bg = palette.base0,
    },
    ListishLocalSign = {
      fg = palette.orange,
      bg = palette.base2,
    },

    ListishLocalExt = {
      fg = palette.orange,
      bg = palette.base0,
    },
    -- }}}
    -- CMP {{{
    CmpDocumentation = {
      fg = palette.green,
      bg = palette.blue,
    },
    CmpDocumentationBorder = {
      fg = palette.border_highlight,
      bg = palette.blue,
    },
    CmpItemAbbr = {
      fg = palette.white,
    },
    CmpItemAbbrDeprecated = {
      fg = palette.grey,
      strikethrough = true,
    },
    CmpItemAbbrMatch = {
      fg = palette.blue,
    },
    CmpItemAbbrMatchFuzzy = {
      fg = palette.blue,
    },
    CmpItemKind = {
      fg = palette.orange,
    },
    CmpItemKindClass = {
      fg = palette.orange,
    },
    CmpItemKindConstant = {
      link = "Constant",
    },
    CmpItemKindConstructor = {
      link = "Constructor",
    },
    CmpItemKindDefault = {
      fg = palette.green_dark,
    },
    CmpItemKindEnum = {
      link = "Enum",
    },
    CmpItemKindEnumMember = {
      fg = palette.green,
    },
    CmpItemKindEvent = {
      fg = palette.orange,
    },
    CmpItemKindField = {
      link = "Field",
    },
    CmpItemKindFunction = {
      link = "Function",
    },
    CmpItemKindInterface = {
      fg = palette.aqua,
    },
    CmpItemKindKeyword = {
      link = "Keyword",
    },
    CmpItemKindMethod = {
      link = "Method",
    },
    CmpItemKindModule = {
      fg = palette.yellow,
    },
    CmpItemKindOperator = {
      link = "Operator",
    },
    CmpItemKindProperty = {
      link = "Property",
    },
    CmpItemKindColor = {
      fg = palette.accent,
    },
    CmpItemKindFile = {
      fg = palette.blue_pale,
    },
    CmpItemKindFolder = {
      fg = palette.yellow,
    },
    CmpItemKindReference = {
      fg = palette.magenta,
    },
    CmpItemKindSnippet = {
      fg = palette.blue,
    },
    CmpItemKindStruct = {
      link = "Struct",
    },
    CmpItemKindText = {
      fg = palette.aqua,
    },
    CmpItemKindTypeParameter = {
      link = "Parameter",
    },
    CmpItemKindUnit = {
      fg = palette.orange,
    },
    CmpItemKindValue = {
      fg = palette.magenta,
    },
    CmpItemKindVariable = {
      link = "Variable",
    },
    CmpItemMenu = {
      fg = palette.base7,
    },
    --}}}
    -- Treesitter {{{
    ["@string"] = {
      link = "String",
    },
    ["@string.regex"] = {
      -- For regexes.
      fg = palette.purple,
    },
    ["@string.escape"] = {
      link = "SpecialChar",
    },
    ["@include"] = {
      link = "Include",
    },
    ["@variable"] = {
      link = "Variable",
    },
    ["@variable.builtin"] = {
      fg = palette.orange,
    },
    ["@enum"] = {
      link = "Enum",
    },
    ["@annotation"] = {
      -- For C++/Dart attributes, annotations that can be attached to the
      -- code to denote some kind of meta information.
      fg = palette.green,
    },
    ["@attribute"] = {
      fg = palette.yellow,
    },
    ["@boolean"] = {
      link = "Boolean",
    },
    ["@comment"] = {
      link = "Comment",
    },
    ["@constant"] = {
      link = "Constant",
    },
    ["@constant.builtin"] = {
      -- For constant that are built in the language: `nil` in Lua.
      fg = palette.orange,
    },
    ["@constant.macro"] = {
      -- For constants that are defined by macros: `NULL` in C.
      fg = palette.purple,
    },
    ["@error"] = {
      link = "Error",
    },
    ["@conditional"] = {
      link = "Conditional",
    },
    ["@character"] = {
      link = "Character",
    },
    ["@constructor"] = {
      link = "Constructor",
    },
    ["@function"] = {
      link = "Function",
    },
    ["@function.call"] = {
      fg = palette.green,
    },
    ["@function.builtin"] = {
      fg = palette.aqua,
    },
    ["@function.macro"] = {
      -- For macro defined fuctions (calls and definitions): each
      -- `macro_rules` in Rust.
      fg = palette.green,
    },
    ["@keyword"] = {
      link = "Keyword",
    },
    ["@keyword.function"] = {
      link = "Function",
    },
    ["@keyword.operator"] = {
      link = "Operator",
    },
    ["@keyword.return"] = {
      link = "Return",
    },
    ["@method"] = {
      link = "Method",
    },
    ["@method.call"] = {
      fg = palette.aqua,
    },
    ["@namespace"] = {
      link = "Namespace",
    },
    ["@number"] = {
      link = "Number",
    },
    ["@operator"] = {
      link = "Operator",
    },
    ["@parameter"] = {
      link = "Parameter",
    },
    ["@parameter.reference"] = {
      fg = palette.white,
    },
    ["@property"] = {
      link = "Property",
    },
    ["@punctuation.delimiter"] = {
      link = "Delimiter",
    },
    ["@punctuation.bracket"] = {
      fg = palette.white,
    },
    ["@punctuation.special"] = {
      -- For special punctutation that does not fall in the catagories
      -- before.
      fg = palette.pink,
    },
    ["@repeat"] = {
      link = "Repeat",
    },
    ["@symbol"] = {
      -- For identifiers referring to symbols or atoms.
      fg = palette.yellow,
    },
    ["@tag"] = {
      link = "Tag",
    },
    ["@tag.delimiter"] = {
      -- Tag delimiter like `<` `>` `/`
      fg = palette.white,
    },
    ["@text"] = {
      -- For strings considered text in a markup language.
      fg = palette.text,
    },
    ["@text.reference"] = {
      fg = palette.yellow,
    },
    ["@text.emphasis"] = {
      -- For text to be represented with emphasis.
      fg = palette.blue_pale,
    },
    ["@text.underline"] = {
      -- For text to be represented with an underline.
      fg = palette.white,
      bg = palette.none,
      underline = true,
    },
    ["@text.title"] = {
      -- Text that is part of a title.
      fg = palette.title,
      bg = palette.none,
      bold = true,
    },
    ["@text.literal"] = {
      -- Literal text.
      fg = palette.white,
    },
    ["@text.uri"] = {
      -- Any URI like a link or email.
      fg = palette.link,
    },
    ["@tag.attribute"] = {
      fg = palette.green,
    },
    ["@label"] = {
      link = "Label",
    },
    ["@type"] = {
      link = "Type",
    },
    ["@type.builtin"] = {
      -- For builtin types.
      fg = palette.purple,
    },
    ["@exception"] = {
      link = "Exception",
    },
    ["@field"] = {
      link = "Field",
    },
    ["@float"] = {
      link = "Float",
    },
    ["@text.note"] = {
      fg = palette.orange,
      bg = palette.info,
      bold = true,
    },
    ["@text.warning"] = {
      -- TODO, HACK, WARNING
      fg = palette.black,
      bg = palette.warning,
      bold = true,
    },
    ["@text.danger"] = {
      -- FIXME, XXX, BUG
      fg = palette.black,
      bg = palette.error,
      bold = true,
    },
    ["@todo"] = {
      link = "Todo",
    },
    ["@debug"] = {
      link = "Debug",
    },
    ["@define"] = {
      link = "Define",
    },
    -- }}}
    -- LSP {{{
    LspCodeLens = {
      fg = palette.orange,
    },
    LspReferenceText = {
      -- used for highlighting "text" references
      fg = palette.accent,
      bg = palette.highlight,
    },
    LspReferenceRead = {
      -- used for highlighting "read" references
      fg = palette.accent,
      bg = palette.highlight,
    },
    LspReferenceWrite = {
      -- used for highlighting "write" references
      fg = palette.accent,
      bg = palette.highlight,
    },
    LspCodeLensSeparator = {
      fg = palette.context,
      italic = true,
    },
    LspDiagnosticsHint = {
      fg = palette.hint,
    },
    LspDiagnosticsInfo = {
      fg = palette.info,
    },
    LspDiagnosticsWarning = {
      link = "Warnings",
    },
    LspHint = {
      fg = palette.hint,
      italic = true,
    },
    -- }}}
    -- Diagnostics {{{
    DiagnosticError = {
      fg = palette.error,
    },
    DiagnosticLineNrError = {
      fg = palette.base4,
      bg = palette.error,
    },
    DiagnosticWarn = {
      fg = palette.warning,
    },
    DiagnosticLineNrWarn = {
      fg = palette.base4,
      bg = palette.warning,
    },
    DiagnosticInfo = {
      fg = palette.green,
    },
    DiagnosticLineNrInfo = {
      fg = palette.base4,
      bg = palette.green,
    },
    DiagnosticHint = {
      fg = palette.blue_pale,
    },
    DiagnosticLineNrHint = {
      fg = palette.base4,
      bg = palette.blue_pale,
    },
    DiagnosticOther = {
      fg = palette.purple,
    },
    -- }}}
    -- ALE {{{
    ALEErrorSign = {
      fg = palette.error,
      bg = palette.base2,
    },
    ALEStyleErrorSign = {
      fg = palette.error,
      bg = palette.base2,
    },
    ALEWarningSign = {
      fg = palette.warning,
      bg = palette.base2,
    },
    ALEStyleWarningSign = {
      fg = palette.warning,
      bg = palette.base2,
    },
    ALEInfoSign = {
      fg = palette.green,
      bg = palette.base2,
    },
    ALEDummySign = {
      fg = palette.blue_pale,
      bg = palette.base2,
    },
    -- }}}
    -- Misc {{{
    illuminatedWord = {
      bg = palette.white,
    },
    illuminatedCurWord = {
      bg = palette.white,
    },
    CursorWord0 = {
      bg = palette.white,
      fg = palette.black,
    },
    CursorWord1 = {
      bg = palette.white,
      fg = palette.black,
    },
    -- }}}
    -- Nvim-Tree {{{
    NvimTreeFolderName = {
      fg = palette.white,
    },
    NvimTreeFolderIcon = {
      fg = palette.accent,
    },
    NvimTreeEmptyFolderName = {
      fg = palette.disabled,
    },
    NvimTreeOpenedFolderName = {
      fg = palette.accent,
      italic = true,
    },
    NvimTreeIndentMarker = {
      fg = palette.disabled,
    },
    NvimTreeGitDirty = {
      fg = palette.blue,
    },
    NvimTreeGitNew = {
      fg = palette.green,
    },
    NvimTreeGitStaged = {
      fg = palette.comments,
    },
    NvimTreeGitDeleted = {
      fg = palette.red,
    },
    NvimTreeOpenedFile = {
      fg = palette.accent,
    },
    NvimTreeImageFile = {
      fg = palette.yellow,
    },
    NvimTreeMarkdownFile = {
      fg = palette.pink,
    },
    NvimTreeExecFile = {
      fg = palette.green,
    },
    NvimTreeRootFolder = {
      fg = palette.pink,
    },
    NvimTreeSpecialFile = {
      fg = palette.white,
      bg = palette.none,
    },
    NvimTreeNormal = {
      fg = palette.white,
      bg = palette.sidebar_bg,
    },
    -- }}}
    -- NeoTree {{{
    NeoTreeBufferNumber = {
      fg = palette.white,
    },
    NeoTreeDirectoryIcon = {
      fg = palette.accent,
    },
    NeoTreeDirectoryName = {
      fg = palette.white,
    },
    NeoTreeFileNameOpened = {
      fg = palette.accent,
    },
    NeoTreeGitAdded = {
      fg = palette.green,
    },
    NeoTreeGitDeleted = {
      fg = palette.red,
    },
    NeoTreeGitUntracked = {
      fg = palette.orange_light,
    },
    NeoTreeGitStaged = {
      fg = palette.comments,
    },
    NeoTreeIndentMarker = {
      fg = palette.disabled,
    },
    NeoTreeNormal = {
      fg = palette.white,
      bg = palette.sidebar_bg,
    },
    NeoTreeRootName = {
      fg = palette.pink,
    },
    NeoTreeGitModified = {
      fg = palette.blue,
    },
    NeoTreeModified = {
      fg = palette.blue,
    },
    -- }}}
    -- Git Signs {{{
    GitSignsAdd = {
      fg = palette.sign_add_bg,
      bg = palette.base2,
    },
    GitSignsAddNr = {
      fg = palette.sign_add_bg_lt,
      bg = palette.base2,
    },
    GitSignsAddInline = {
      fg = palette.sign_add_bg,
      bg = palette.base2,
    },
    GitSignsAddLnInline = {
      fg = palette.sign_add_bg,
      bg = palette.base2,
    },
    GitSignsAddVirtLnInline = {
      fg = palette.sign_add_bg,
      bg = palette.base2,
    },
    GitSignsChange = {
      fg = palette.sign_change_bg,
      bg = palette.base2,
    },
    GitSignsChangeNr = {
      fg = palette.sign_change_bg_lt,
      bg = palette.base2,
    },
    GitSignsChangeInLine = {
      fg = palette.sign_change_bg,
      bg = palette.base2,
    },
    GitSignsChangeVirtLnInline = {
      fg = palette.sign_change_bg,
      bg = palette.base2,
    },
    GitSignsChangeLnInline = {
      fg = palette.sign_change_bg,
      bg = palette.base2,
    },
    GitSignsDelete = {
      fg = palette.sign_remove_bg,
      bg = palette.base2,
    },
    GitSignsDeleteNr = {
      fg = palette.sign_remove_bg_lt,
      bg = palette.base2,
    },
    GitSignsDeleteInLine = {
      fg = palette.sign_remove_bg,
      bg = palette.base2,
    },
    GitSignsDeleteLnInline = {
      fg = palette.sign_remove_bg,
      bg = palette.base2,
    },
    GitSignsDeleteVirtLnInline = {
      fg = palette.sign_remove_bg,
      bg = palette.base2,
    },
    -- }}}
    -- Notifications {{{
    NotifyERRORBorder = {
      fg = palette.error,
    },
    NotifyWARNBorder = {
      fg = palette.warning,
    },
    NotifyINFOBorder = {
      fg = palette.info,
    },
    NotifyDEBUGBorder = {
      fg = palette.grey,
    },
    NotifyTRACEBorder = {
      fg = palette.pink,
    },
    NotifyERRORIcon = {
      fg = palette.error,
    },
    NotifyWARNIcon = {
      fg = palette.warning,
    },
    NotifyINFOIcon = {
      fg = palette.info,
    },
    NotifyDEBUGIcon = {
      fg = palette.grey,
    },
    NotifyTRACEIcon = {
      fg = palette.pink,
    },
    NotifyERRORTitle = {
      fg = palette.error,
    },
    NotifyWARNTitle = {
      fg = palette.warning,
    },
    NotifyINFOTitle = {
      fg = palette.info,
    },
    NotifyDEBUGTitle = {
      fg = palette.grey,
    },
    NotifyTRACETitle = {
      fg = palette.pink,
    },
    NotifyBackground = {
      fg = palette.white,
      bg = palette.base1,
    },
    -- }}}
    -- Fidget {{{
    FidgetTitle = {
      fg = palette.blue_pale,
    },
    FidgetTask = {
      fg = palette.green,
    },
    --}}}
    -- BQF {{{
    BqfPreviewBorder = {
      fg = palette.green_dark,
    },
    --}}}
    -- Misc {{{
    SubstituteExchange = {
      bg = palette.blue_light,
      bold = true,
    },
    -- }}}
    -- Noice {{{
    NoiceFormatProgressDone = {
      bg = palette.base1,
    },
    NoiceFormatProgressTodo = {
      bg = palette.base1,
    },
    -- }}}
    -- Neotest {{{
    NeotestFailed = {
      fg = palette.error,
      bg = palette.base2,
    },
    NeotestPassed = {
      fg = palette.green,
      bg = palette.base2,
    },
    NeotestRunning = {
      fg = palette.aqua,
      bg = palette.base2,
    },
    NeotestSkipped = {
      fg = palette.orange,
      bg = palette.base2,
    },
    -- }}}
    -- Marks Nvim {{{
    MarkSignHL = { -- displayed mark signs.
      fg = palette.pink_light,
      bg = palette.base2,
    },
    MarkSignNumHL = {}, -- the number line in a signcolumn.
    MarkVirtTextHL = { -- bookmark virtual text annotations.
      fg = palette.pink_light,
      bg = palette.none,
      italic = true,
    },
    -- }}}
    -- Vim Matchup {{{
    MatchParen = {
      -- The character under the cursor or just before it, if it is a paired
      -- bracket, and its match. |pi_paren.txt|
      fg = palette.red,
      bg = palette.none,
    },
    -- }}}
    -- Navic {{{
    NavicIcons = {
      fg = palette.blue_pale,
      bg = palette.base3,
    },
    NavicText = {
      fg = palette.white,
    },
    NavicIconsFile = {
      link = "CmpItemKindFile",
    },
    NavicIconsModule = {
      link = "CmpItemKindModule",
    },
    NavicIconsNamespace = {
      link = "Namespace",
    },
    NavicIconsPackage = {
      link = "CmpItemKindPackage",
    },
    NavicIconsClass = {
      link = "CmpItemKindClass",
    },
    NavicIconsMethod = {
      link = "Method",
    },
    NavicIconsProperty = {
      link = "Property",
    },
    NavicIconsField = {
      link = "Field",
    },
    NavicIconsConstructor = {
      link = "Constructor",
    },
    NavicIconsEnum = {
      link = "Enum",
    },
    NavicIconsInterface = {
      link = "CmpItemKindInterface",
    },
    NavicIconsFunction = {
      link = "Function",
    },
    NavicIconsVariable = {
      link = "Variable",
    },
    NavicIconsConstant = {
      link = "Constant",
    },
    NavicIconsString = {
      link = "CmpItemKindString",
    },
    NavicIconsNumber = {
      link = "Number",
    },
    NavicIconsBoolean = {
      link = "CmpItemKindBoolean",
    },
    NavicIconsArray = {
      link = "CmpItemKindArray",
    },
    NavicIconsObject = {
      link = "CmpItemKindObject",
    },
    NavicIconsKey = {
      link = "CmpItemKindKey",
    },
    NavicIconsNull = {
      link = "CmpItemKindNull",
    },
    NavicIconsEnumMember = {
      link = "CmpItemKindEnumMember",
    },
    NavicIconsStruct = {
      link = "Struct",
    },
    NavicIconsEvent = {
      link = "CmpItemKindEvent",
    },
    NavicIconsOperator = {
      link = "Operator",
    },
    NavicIconsTypeParameter = {
      link = "Parameter",
    },
    -- }}}
  }
end
-- }}}

-- Setup function {{{
---Creates all highlighting from the given palette.
---@param palette string could be 'light_palette' or 'dark_palette'
---@param name string the colour scheme name
local setup = function(palette, name) --{{{
  vim.cmd.clear()
  if vim.fn.exists("syntax_on") then
    vim.cmd.syntax("reset")
  end

  vim.g.colors_name = name
  for group, colors in pairs(internals(palette)) do
    vim.api.nvim_set_hl(0, group, colors)
  end
  for group, colors in pairs(plugin_syntax(palette)) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end --}}}

return {
  setup = setup,
}
-- }}}

-- vim: fdm=marker fdl=1
