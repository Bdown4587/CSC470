;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname parser) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(define neo-bool-code-parser
  (lambda (neo-code)
     (if (equal? (length neo-code) 3)
            (list 'bool-exp (elementAt neo-code 1) (neo-parser (caddr neo-code)) '())
        (cons 'bool-exp (cons (cadr neo-code) (map neo-parser (cddr neo-code)))))     
    )
  )

(define neo-math-code-parser
  (lambda (neo-code)
    (list 'math-exp (cadr neo-code)
             (neo-parser (caddr neo-code))
             (neo-parser (cadddr neo-code)))
    )
  )

(define neo-function-code-parser
  (lambda (neo-code)
    (list 'func-exp
             (list 'params (cadr neo-code))
             (list 'body-exp (neo-parser (caddr neo-code))))
    )
  )

(define neo-ask-code-parser
  (lambda (neo-code)
    (cons 'ask-exp
             (map neo-parser (cdr neo-code)))
    )
  )

(define neo-call-code-parser
  (lambda(neo-code)
    (list 'app-exp
             (neo-parser (cadr neo-code))
             (neo-parser (caddr neo-code)))
    )
  )

(define neo-let-code-parser
  (lambda (neo-code)
    (list 'let-exp (elementAt neo-code 1) (neo-parser (elementAt neo-code 2)))
    )
  )

(provide (all-defined-out))
