(use awful html-tags)

(enable-sxml #t)
(generate-sxml? #t) ;; from html-tags
(define-page (main-page-path)
  (lambda ()
    (<html> (<body>
      (<h1> "Lakeview Baptist Church of Northwest Arkansas")))))

