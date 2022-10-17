;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname runner) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(define resolve
  (lambda (environment varname)
    (cond
      ((null? environment) #false)
      ((equal? (caar environment) varname) (cadar environment))
      (else (resolve (cdr environment) varname))
      )
    )
  )

(define extend-env
  (lambda (list-of-varname list-of-value env) 
    (cond
      ((null? list-of-varname) env)
      ((null? list-of-value) env)
      (else (extend-env (cdr list-of-varname) (cdr list-of-value)
       (cons (list (car list-of-varname)
                   (car list-of-value))
             env)))
             
(define run-bool-parsed-code
  (lambda(parsed-code env)
    (let ((op (elementAt parsed-code 0))
          (num1 (run-neo-parsed-code (elementAt parsed-code 1) env))
          (num1 (run-neo-parsed-code (elementAt parsed-code 2) env)))
            (cond
              ((equal? op '>) (> num1 num2))
              ((equal? op '<) (< num1 num2))
              ((equal? op '>=) (>= num1 num2))
              ((equal? op '<=) (<= num1 num2))
              ((equal? op '==) (= num1 num2))
              ((equal? op '!=) (not num1 num2))
              ((equal? op '&&) (and num1 num2))
              (else (not num1))       
          )
       )
   )
)            
(define run-math-exp
  (lambda (op num1 num2)
    (cond
      ((equal? op '+) (+ num1 num2))
      ((equal? op '-) (- num1 num2))
      ((equal? op '/) (/ num1 num2))
      ((equal? op '//) (quotient num1 num2))
      ((equal? op '%) (modulo num1 num2))
      (else #false)       
      )
    )
  )
  
  (define run-let-exp
    (lambda (parsed-code env)
      (let ((list-of-name getVarnames (elementAt parsed-code 1))
            (list-of-values getValues (elementAt parsed-code 1))
            (new-env (extend-env list-of-names list-of-values env))
            (body (elementAt parsed-code 2)))
      (run-neo-parsed-code parsed-code env)
      )
    )
(provide (all-defined-out)
