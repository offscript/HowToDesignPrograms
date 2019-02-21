;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_5_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define-struct vel [deltax deltay])
(define-struct ufo [loc vel])

(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))
 
(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))
 
(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))


; Data Definition
; A UFO is a structure: 
;   (make-ufo Posn Vel)
; interpretation (make-ufo p v) is at location
; p moving at velocity v

; UFO -> UFO
; determines where u moves in one clock tick; 
; leaves the velocity as is

(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2)
              (make-ufo (make-posn 17 77) v2))
 
(define (ufo-move-1 u)
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))

#|

Again, note that in the function above we do not modify the ufo-loc and ufo-vel
structure's two fields in the ufo-move-1, we simply retrieve the two structures
and give them to another function who does that work for us.

|#

; Posn Vel -> Posn 
; adds v to p 
;stub: (define (posn+ p v) p)
;tests
;intermediate stub, where we collect our relavant data
;(define (posn+ p v)
  ;(... (posn-x p) ... (posn-y p) ...
   ;... (vel-deltax v) ... (vel-deltay v) ...))
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))

(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

