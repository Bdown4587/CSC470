#reader(lib "htdp-advanced-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang racket
(require "utility.rkt")
(require "runner.rkt")
(require "parcer.rkt")

(define parsed-neo-code (neo-parser '(call (function (a) b) (5))))

(run-neo-parsed-code parsed-neo-code env)

;((r 5) (a 1) (b 2) (c 5))
function fun1(a){
  return d;
}
fun1(5);                          
                         


 
