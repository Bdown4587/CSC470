#reader(lib "htdp-advanced-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(require "runner.rkt")
(require "parcer.rkt")
(require "variable_env.rkt")

(define env '((global (a 1) (b 2) (c 5))))

;(define sample-code '(call (function (r) (local-vars ((p 100)) (math / r p)) ) (a)))
(define sample-code '(local-vars ((a 7) (b a) (x b)) (math + x a)))
(displayln (neo-parser sample-code))
(define parsed-neo-code (neo-parser sample-code))
(run-neo-parsed-code parsed-neo-code env)
 
