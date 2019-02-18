;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.7_Exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;Physical Constants
(define SCENE-HEIGHT 200)
(define SCENE-WIDTH 200)
(define CIRCLE-RADIUS 30)

(define BACKGROUND
  (empty-scene SCENE-HEIGHT SCENE-WIDTH))
;draw-circle
;Function Signature: String -> image
;Actually draws the circle in place-image. I have havin in-line functions in this thing
;Functions should be one set of logic only, or else it starts to look busy.
(define (draw-circle color)
  (circle CIRCLE-RADIUS "solid" color))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs. Takes a traffic light color and
; returns the next 
(define (tl-next cs)
  (+ cs 1))


(define (draw-scene color)
  (place-image (draw-circle color) 100 100 BACKGROUND))

;render
;Function Signature: WorldState -> Image
;Purpose Statement: Take a ws, determine what traffic signal corresponds to that ws
;then indicate to the draw-scene function what color to make the traffic circle
(define (tl-render ws)
  (cond
    [(= (modulo ws 3) 0) (draw-scene "green")]
    [(= (modulo ws 3) 1) (draw-scene "yellow")]
    [(= (modulo ws 3) 2) (draw-scene "red")])
  )

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))
