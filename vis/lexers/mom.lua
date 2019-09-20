-- groff_mom lexer created by John Ankarström
-- based on man/roff LPeg lexer created by:
--     Copyright 2015-2017 David B. Lamkins <david@lamkins.net>
-- under the MIT license.

local l = require('lexer')
local token, word_match = l.token, l.word_match
local P, R, S = lpeg.P, lpeg.R, lpeg.S

local M = {_NAME = 'mom'}

-- Helpers
function non(pattern)
	return l.nonnewline - P(pattern)
end
function enclosed(first, last)
	return P(first) * non(last)^0 * P(last)
end

-- Whitespace
local ws = token(l.WHITESPACE, l.space^1)

-- Preprocessor
local arguments = (l.nonnewline_esc - P'\\"')^0
local command = token('command', l.starts_line('.') * arguments)
local heading = token('heading', l.starts_line('.') * P'HEADING ' * arguments)
local comment = token('comment', P'\\"' * l.nonnewline^0)
local preprocessor = (heading + command) * comment^-1

local line_comment = token('comment',
	l.starts_line('.')
	* (P'\\"' + P'\\#')
	* l.nonnewline^0)

-- Text
local text_comment = token('comment', P'\\#' * l.nonnewline^0)
local inline_escape = token('escape', P'\\' * P(1))
local inline_escape_bracketed =
	inline_escape * token('escape_argument', enclosed('[', ']'))
local inline_escape_quoted =
	inline_escape * token('escape_argument', enclosed("'", "'"))

-- Special syntax
local italic = token('italic', enclosed('__', '_'))

M._rules = {
	{'whitespace', ws},
	{'line_comment', line_comment},
	{'preprocessor', preprocessor},
	{'text_comment', text_comment},
	{'inline_escape_bracketed', inline_escape_bracketed},
	{'inline_escape_quoted', inline_escape_quoted},
	{'inline_escape', inline_escape},
	{'italic', italic},
}

M._tokenstyles = {
	command = l.STYLE_PREPROCESSOR,
	heading = l.STYLE_PREPROCESSOR..',bold,reverse',
	comment = l.STYLE_COMMENT,
	escape = l.STYLE_EMBEDDED,
	escape_argument = l.STYLE_EMBEDDED..',bold',
	italic = 'underlined',
}

return M
