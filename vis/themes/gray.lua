-- Acme editor color scheme
local lexers = vis.lexers

lexers.STYLE_DEFAULT = ''
lexers.STYLE_NOTHING = ''
lexers.STYLE_CLASS = ''
lexers.STYLE_COMMENT = 'fore:#7F8D9E' -- #a8a8a8
lexers.STYLE_CONSTANT = ''
lexers.STYLE_DEFINITION = ''
lexers.STYLE_ERROR = 'fore:red'
lexers.STYLE_FUNCTION = ''
lexers.STYLE_KEYWORD = ',bold'
lexers.STYLE_LABEL = ''
lexers.STYLE_NUMBER = ''
lexers.STYLE_OPERATOR = 'fore:#7F8D9E'
lexers.STYLE_REGEX = ''
lexers.STYLE_STRING = 'fore:white'
lexers.STYLE_PREPROCESSOR = 'fore:white'
lexers.STYLE_TAG = ''
lexers.STYLE_TYPE = ''
lexers.STYLE_VARIABLE = ''
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'back:#666666'
lexers.STYLE_IDENTIFIER = ''

lexers.STYLE_LINENUMBER = 'fore:#666666'
lexers.STYLE_LINENUMBER_CURSOR = 'fore:default'
lexers.STYLE_CURSOR = 'reverse'
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',fore:#90ece9'
lexers.STYLE_CURSOR_LINE = 'underlined'
lexers.STYLE_COLOR_COLUMN = 'back:blue'
lexers.STYLE_SELECTION = 'back:#4E698C' -- #444444
lexers.STYLE_STATUS = 'back:#4E698C'
lexers.STYLE_STATUS_FOCUSED = 'back:#4E698C,bold'
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = 'fore:#444444'
