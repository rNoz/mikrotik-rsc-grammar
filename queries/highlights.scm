; ── MikroTik RouterOS Script — highlights ──────────────────────
; Query file must match the node names produced by the grammar at
; https://github.com/keiras94/mikrotik-rsc-grammar (rev 318e73ab).

; ── Comments ─────────────────────────────────────────────────────
(comment) @comment

; ── Menu prefix "/" ──────────────────────────────────────────────
(menu_prefix) @punctuation.special

; ── Menu paths ──────────────────────────────────────────────────
; Root + segments in /ip/route/add ...
(menu_command
  (menu_path
    (identifier) @string.special.path))

; Bare identifiers inside a menu command that are not part of the path
; (typically action verbs like add/print/set).
(menu_command
  (identifier) @function)

; ── Named parameters — property=value ──────────────────────────
(named_param
  name: (identifier) @property)

(named_param
  value: (identifier) @constant)

(named_param
  value: (literal (string)) @string)

(named_param
  value: (literal (number)) @number)

(named_param
  value: (literal (boolean_literal)) @boolean)

(named_param "=" @operator)

; ── Global commands (:put, :local, :for, etc.) ──────────────────
(global_command_name) @keyword

; Control flow keywords
(global_command
  (global_command_name) @keyword.control
  (#match? @keyword.control ":(do|while|if|for|foreach|return|error|onerror|retry)$"))

; Storage keywords
(global_command
  (global_command_name) @keyword.storage.type
  (#match? @keyword.storage.type ":(local|global|set)$"))

; ── Control keywords ───────────────────────────────────────────
"do" @keyword.control
"else" @keyword.control
"while" @keyword.control
"in" @keyword

; ── Booleans ────────────────────────────────────────────────────
(boolean_literal) @boolean

; ── Nil ─────────────────────────────────────────────────────────
(nil_literal) @constant.builtin

; ── Function calls ──────────────────────────────────────────────
(function_call
  (identifier) @function.call)

; ── Variables ───────────────────────────────────────────────────
(variable_reference
  "$" @punctuation.special
  (identifier) @variable)

; ── Strings ────────────────────────────────────────────────────
(string) @string

; ── Numbers ─────────────────────────────────────────────────────
(number) @number

; ── IP addresses / prefixes ─────────────────────────────────────
(ip_address) @constant
(ip_prefix) @constant

; ── Operators ───────────────────────────────────────────────────
(operator) @operator

; ── Brackets and punctuation ───────────────────────────────────
[
  "(" ")" "[" "]" "{" "}"
] @punctuation.bracket

; ── Statement separator ────────────────────────────────────────
";" @punctuation.delimiter

; ── Line continuation ──────────────────────────────────────────
(line_continuation) @punctuation.special

; ── Parent navigation ───────────────────────────────────────────
(parent_navigation) @string.special.path

; ── Command substitution ───────────────────────────────────────
(command_substitution
  "[" @punctuation.bracket
  "]" @punctuation.bracket)

; ── Subexpressions ──────────────────────────────────────────────
(subexpression
  "(" @punctuation.bracket
  ")" @punctuation.bracket)

; ── Block delimiters ───────────────────────────────────────────
(block
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

; ── Arrays ─────────────────────────────────────────────────────
(array
  "{" @punctuation.bracket
  "}" @punctuation.bracket)
