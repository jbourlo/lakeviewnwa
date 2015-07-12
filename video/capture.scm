(use posix)

(define capture "df --block-size=g")

(define (start)
  (let-values 
    (((in out id) (process capture)))
    (port-for-each print (lambda()(read-line in)))))
(start)
