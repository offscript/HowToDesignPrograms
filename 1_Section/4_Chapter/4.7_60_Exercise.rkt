;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.7_60_Exercise) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;Physical Constants
(define SCENE-HEIGHT 200)
(define SCENE-WIDTH 200)
(define CIRCLE-RADIUS 30)

(define BACKGROUND
  (empty-scene SCENE-HEIGHT SCENE-WIDTH))

(define RED 0)
(define GREEN 1)
(define YELLOW 2)
 
; An S-TrafficLight is one of:
; – RED
; – GREEN
; – YELLOW

;draw-circle
;Function Signature: String -> image
;Actually draws the circle in place-image. I have havin in-line functions in this thing
;Functions should be one set of logic only, or else it starts to look busy.
(define (draw-circle color)
  (circle CIRCLE-RADIUS "solid" color))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs. Takes a traffic light color and
; returns the next 
; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next- ... RED) YELLOW)
(check-expect (tl-next- ... YELLOW) GREEN)
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))



(define (draw-scene color)
  (place-image (draw-circle color) 100 100 BACKGROUND))

;render
;Function Signature: WorldState -> Image
;Purpose Statement: Take a ws, determine what traffic signal corresponds to that ws
;then indicate to the draw-scene function what color to make the traffic circle
(define (tl-render ws)
  (cond
    [(= ws 0) (draw-scene "red")]
    [(= ws 1) (draw-scene "green")]
    [(= ws 2) (draw-scene "yellow")])
  )

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-numeric 1]))
