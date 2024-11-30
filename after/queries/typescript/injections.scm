; extends

; Mark all string fragments as sql
; because I couldn't find a better way
(
    [
        (string_fragment)
    ] @injection.content
    (#set! injection.language "sql")
)

;
;(
;    [
;        (template_string)
;    ] @injection.content
;    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
;    (#offset! @injection.content 0 1 0 -1)
;    (#set! injection.language "sql")
;)
;

; mark all template strings as SQL
;(
;    [
;        (template_string)
;    ]
;    (#set! injection.language "sql")
; )

; foo.sql`...` or foo.sql(`...`)
;(call_expression
;  arguments: [
;    (arguments
;      (template_string) @injection.content)
;    (template_string) @injection.content
;  ]
;  (#set! injection.language "sql"))
;
;(
;    [
;        (template_string)
;    (arguments
;      (template_string) @injection.content)
;    ] @injection.content
;    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
;    (#set! injection.language "sql")
;)
