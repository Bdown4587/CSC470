#reader(lib "htdp-advanced-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(require "runner.rkt")
(require "parcer.rkt")

(define env '((a 1) (b 2) (c 5)))

 dispalyln (neo-parser '(call (function(x) (local-vars ((a 1) (b 2) (c 3)) (math + a b))) (5)))
 
