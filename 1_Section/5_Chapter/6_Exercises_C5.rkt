;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#| Example Structure Data Definition

(define-struct posn [x y])
; A Posn is a structure: 
;   (make-posn Number Number)
; interpretation a point x pixels from left, y from top

|#

#| Exercise 73:

Formulate a data definition for the above phone structure type
definition that accommodates the given examples.

(define-struct phone [area number])
; A phone is a structure:
;intepretation means a phone number with two Numbers (type)
;an area code to distinguish the general geographic area of a phone number at a national level
;and a number that identifies a specific phone in that area

(define-struct phone# [area switch num])
; A phone# is a structure:
;intepretation means a phone number with three Numbers (type)
;an area code to distinguish the general geographic area of a phone number at a national level
;a switch to designate an smaller space within the area code, like a town, community, or neighborhood
;and a number that identifies a specific phone in that area

|#

#|

Sample Problem Your team is designing an interactive game program that moves
a red dot across a image canvas and allows players to use the mouse to reset
the dot. Here is how far you got together:

|#

(require 2htdp/universe)
(require 2htdp/image)
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; Posn -> Posn 
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

; Posn -> Image
; adds a red spot to MTS at p
;stub
; (define (scene+dot p) MTS)
;tests
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))
(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

;function x+, increments the x coordinate by some number on every clock tick

; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))
;stub
;(define (x+ p)
;  (... (posn-x p) ... (posn-y p) ...))
(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))
;make a posn with the value of the given posn + 3, and the y value of the given
;posn 
#|

Exercise 73. Design the function posn-up-x, which consumes a Posn p
and a Number n. It produces a Posn like p with n in the x field.

|#

;function posn-up-x
;posn, n -> posn
;Purpose Statement: Changes the x value of a posn from x to the given n value
(define (posn-up-x p x)
  (make-posn (+ (posn-x p) x) (posn-y p)))
(check-expect (posn-up-x (make-posn 10 10) 4) (make-posn 14 10))

;function reset-dot
; Posn Number Number MouseEvt -> Posn 
; for mouse clicks, (make-posn x y); otherwise p
; stub: (define (reset-dot p x y me) p)
(check-expect
  (reset-dot (make-posn 10 20) 29 31 "button-down")
  (make-posn 29 31))
(check-expect
  (reset-dot (make-posn 10 20) 29 31 "button-up")
  (make-posn 10 20))

(define (reset-dot p x y me)
  (cond
    [(mouse=? me "button-down") (make-posn x y)]
    [else p]))