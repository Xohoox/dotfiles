; (
;   (element
;     (STag
;       (Name) @tag_name (#eq? @tag_name "inline-job-processor"))
;     (content
;       (CDSect
;         (CData) @javascript)))
;   (#set! injection.language "javascript")
;   (#set! injection.combined)
;   (#set! injection.include-children)
; )


; ((element
;   (STag
;     (Name) @_name)
;   (content) @injection.content)
;   (#eq? @_name "inline-job-processor")
;   (#set! injection.combined)
;   (#set! injection.include-children)
;   (#set! injection.language "javascript"))
;

; ((element
;   (STag
;     (Name) @_name)
;   (content
;     (CDSect) @injection.content))
;   (#eq? @_name "inline-job-processor")
;   (#set! injection.combined)
;   (#set! injection.include-children)
;   (#set! injection.language "javascript"))

;; Highlight JavaScript inside a specific XML element with name "inline-job-processor" only if it contains CDATA
((element
  (STag
    (Name) @_name)
  (content
    (CDSect
      (CData) @injection.content))
  )
  (#eq? @_name "inline-job-processor")
  (#set! injection.language "javascript"))
  ; (#set! injection.combined)
  (#set! injection.include-children)

