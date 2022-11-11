;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#lang racket
(require "utility.rkt")
(define neo-parser
  (lambda (neo-code)
    (cond
      ((null? neo-code) '())
      ((number? neo-code) (list 'num-exp neo-code))
      ((symbol? neo-code) (list 'var-exp neo-code))
      ;(bool op num1 num2) > (bool-exp op (neo-exp) (neo-exp))
       ((equal? (car neo-code) 'bool) (neo-bool-code-parser neo-code))
      ;(math op num1 num2) > (math-exp op (neo-exp) (neo-exp))
      ((equal? (car neo-code) 'math) (neo-math-code-parser neo-code))
      ;(ask (bool op num1 num2) (neo-exp1) (neo-exp2)) > (ask-exp (bool-exp ...) (parsed-neo-exp1) (parsed-neo-exp2))
      ((equal? (car neo-code) 'ask) (neo-ask-code-parser neo-code))
      ((equal? (car neo-code) 'function) (neo-function-code-parser neo-code))
      ;(call (function (x y z) (math + (math + x y) z)) (1 2 3)) ->
      ;(app-exp (func-exp (params (identifier1, identifier2, identifer3 ...)) (body-exp)) ((neo-exp1 neo-exp2 neo-exp3 ...))
      ((equal? (car neo-code) 'call) (neo-call-code-parser neo-code))
      ((equal? (car neo-code) 'local-vars) (neo-let-code-parser neo-code))
      (else (map neo-parser neo-code)) ;((neo-parser 1) (neo-parser 'a) (neo-parser (math + 1 2)))
      )
    )
  )
