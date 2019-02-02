;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3.6_Exercises_43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Physical Constants
(define WHEEL-RADIUS 5)
(define WIDTH-OF-WORLD (* WHEEL-RADIUS 40))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define HEIGHT-OF-WORLD (* WHEEL-RADIUS 40))


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
;The scene the car will be placed in. A rectangle.
(define BACKGROUND
  (empty-scene HEIGHT-OF-WORLD WIDTH-OF-WORLD))
(check-expect (image-height BACKGROUND) HEIGHT-OF-WORLD)
(check-expect (image-width BACKGROUND) WIDTH-OF-WORLD)
;A tree in the scene
(define TRUNK-HEIGHT 20)
(define TRUNK-WIDTH 2)
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle TRUNK-WIDTH TRUNK-HEIGHT "solid" "brown")))
;New scene with tree
(define TREE-BACKGROUND
  (place-image TREE (/ WIDTH-OF-WORLD 2)
  (- HEIGHT-OF-WORLD TRUNK-HEIGHT) (empty-scene HEIGHT-OF-WORLD WIDTH-OF-WORLD)))
;The Y-Axis of the car inside of the place-image function
(define Y-CAR (- HEIGHT-OF-WORLD (/ (image-height CAR) 2)))

;An AnimationState is a Number
; interpretation: the number of clock ticks since
; the start of the animation

;Functions

; tock
; WorldState -> WorldState
; moves the car by x, 3 in this case, by 3 for every clock tick
;examples
; given: 6, expect: 9
(check-expect (tock 6) 7)
(check-expect (tock 8) 9)
; given: 8, expect: 11
(define (tock ws)
  (+ ws 1))

;end?
;determines if the car has reached the end of the scene, this time if the front
;of the car ahs reached the rightmost portion of the scene. So this will be if
; car-right = WIDTH-OF-WORLD
(define (end? ws) (= (CAR-RIGHT ws) WIDTH-OF-WORLD))
;sine-end? stop the sine-animation after a given number of tocks.
(define AFTER-TOCKS 2000)
(define (sine-end? ws) (= ws AFTER-TOCKS))

;car-right
;WorldState -> number
;calculates the front of the car given the worldstate and the constant CAR.
;Since the ws determines the x coordinate of the car from the car's x-center,
;the front of the car can be found by adding half the length of the car to the
;current ws.
(define (CAR-RIGHT ws) (+ ws (/ (image-width CAR) 2)))

;Class Definition: We represent the state of the world as a set of graphics
;Function Signature: WorldState -> Image
;Purpose Statement: Take the Worldstate, a number representing an x cooridnate,
;and plot the car onto a background
;Header
(define (render ws)
   (place-image CAR ws Y-CAR TREE-BACKGROUND))
(define (test-render ws)
   (place-image CAR ws (+ (sin ws) 100) TREE-BACKGROUND))

;mouse-event/hyper
;Function Signature: WorldState Number Number String (mouse coordinates) -> WorldState
;Purpose Statement: places the car at x-mouse (x-coord) if the mouse is clicked, which
;is the mouse event (me) "button down"
; given: 21 10 20 "enter" don't respond to event
; wanted: 21
(check-expect (hyper 21 10 20 "enter") 21)
; given: 42 10 20 "button-down" respond to event
; wanted: 10
(check-expect (hyper 42 10 20 "button-down") 10)
; given: 42 10 20 "move" don't respond to event
; wanted: 42
(check-expect (hyper 42 10 20 "move") 42)
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))


; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))

(define (sine-main ws)
  (big-bang ws
     [on-tick tock]
     [to-draw test-render]
     [stop-when end?]))

(define (hyper-main ws)
   (big-bang ws
     [on-tick tock]
     [on-mouse hyper]
     [to-draw render]
     [stop-when end?]))

