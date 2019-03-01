;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Sample Problem:
Design a function that computes the distance of objects in a 3-dimensional space
to the origin.
|#

;1) Data Definition
(define-struct r3 [x y z])
; An R3 is a structure:
;   (make-r3 Number Number Number)
;Function Signature: Number Number Number -> r3
;Purpose Statement: Takes 3 numbers representing distances from the origin and puts
;them together to describe a point in space.
;(define-struct r3 [x y z])

#|

2) Function Signature, Purpose Statement, Function Header
Function Signature: r3 -> Number
Purpose Statement: Takes an r3 object and calculates the distance in 3d space
from the object to the origin.
Function Header:
(define (r3-distance-to-0 p)
  (... (r3-x p) ... (r3-y p) ... (r3-z p) ...)
given: [3 3 5]
;Functional Examples |#
 
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))