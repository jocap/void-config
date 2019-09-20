-- Xresources lexer created by John Ankarström
-- based on man/roff LPeg lexer created by:
--     Copyright 2015-2017 David B. Lamkins <david@lamkins.net>
-- under the MIT license.

local l = require('lexer')
local token, word_match = l.token, l.word_match
local P, R, S = lpeg.P, lpeg.R, lpeg.S

local M = {_NAME = 'xres'}

-- Helpers
function non(x)
	return l.nonnewline - x
end

-- Whitespace
local ws = token(l.WHITESPACE, l.space^1)

-- Preprocessor
local comment = token(l.COMMENT, l.starts_line('!') * l.nonnewline^0)
local preprocessor = token(l.PREPROCESSOR, l.starts_line('#') * l.nonnewline^0)
local key = token(l.VARIABLE, l.starts_line(l.any) * (l.nonnewline - P':')^1)

M._rules = {
	{'whitespace', ws},
	{'comment', comment},
	{'preprocessor', preprocessor},
	{'key', key},
}

return M
