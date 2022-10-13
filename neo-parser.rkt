;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname neo-parser) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(define neo-parser
  (lambda (neo-code)
    (cond
      ((null? neo-code) '())
      ((number? neo-code) (list 'num-exp neo-code))
      ((symbol? neo-code) (list 'var-exp neo-code))
       ((equal? (car neo-code) 'bool) (neo-bool-code-parser neo-code))
      ((equal? (car neo-code) 'math) (neo-math-code-parser neo-code))
      ((equal? (car neo-code) 'ask) (neo-ask-code-parser neo-code))
      ((equal? (car neo-code) 'function) (neo-function-code-parser neo-code))
      ((equal? (car neo-code) 'call) (neo-call-code-parser neo-code))
      ((equal? (car neo-code) 'local-vars) (neo-let-code-parser neo-code))
      (else (map neo-parser neo-code))
      )
    )
  )
