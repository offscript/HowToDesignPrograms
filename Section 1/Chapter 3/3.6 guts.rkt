;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.6 guts|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Physical Constants
(define WHEEL-RADIUS 5)
(define WIDTH-OF-WORLD (* WHEEL-RADIUS 40))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))


;Image Constants
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "outline" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define CAR-BODY
  (above
   (rectangle WHEEL-DISTANCE (* WHEEL-RADIUS 2) "solid" "blue")
   (rectangle (* WHEEL-DISTANCE 2) (* WHEEL-RADIUS 2) "solid" "blue"))
  )
(define CAR
  (above CAR-BODY BOTH-WHEELS))

;Functions

; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
(define (render x)
  WIDTH-OF-WORLD)
 
; WorldState -> WorldState
; moves the car by x, 3 in this case, by 3 for every clock tick
;examples
; given: 6, expect: 9
; given: 8, expect: 11
(define (tock ws)
  (+ ws 3))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))