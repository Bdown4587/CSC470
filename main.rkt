;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(require "runner.rkt")
(require "parcer.rkt")
(require "variable_env.rkt")

(define env '((a 1) (b 2) (c 5)))

(define parsed-neo-code (neo-parser '(call (function(x) (local-vars ((a 3) (b 7) (c 3)) (math + a b))) (5))))

(run-neo-parsed-code parsed-neo-code env)