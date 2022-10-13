;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname utility) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(define elementAt
  (lambda(lst index)
    (cond
      ((not (list? lst)) "this isn't a lis")
      ((null? lst) "this is empty or index is not in bounds.")
      ((equal? index 0) (car lst))
      (else (elementAt (cdr lst) (- index 1)))
      )
    )
  )

(define getVarnames
  (lambda (lst)
    (if (null? lst) '()
        (cons (car (car lst)) (getVarnames (cdr lst)))
        )
    )
  )

(define getValues
  (lambda (lst)
    (if (null? lst) '()
        (cons (car (cdr (car lst))) (getValues (cdr lst)))
        )
    )
  )

(provide (all-defined-out))