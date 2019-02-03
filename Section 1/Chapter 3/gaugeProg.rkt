;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gaugeProg) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;Physical Constants
(define TOCK_HAPPINESS_VALUE .01)
(define DOWN_ARROW_HAPPINESS_VALUE .2)
(define UP_ARROW_HAPPINESS_VALUE (/ 1 3))

;Graphical Constants

;Functions

;tock
;Function Signature: WorldState (Number) -> WorldState (Number)
;Purpose Statement: Decreases the happiness gauge by some number.
;Constants used?
;HAPPINESS_DECREASED
(define (tock ws)
  (- ws TOCK_HAPPINESS_VALUE))

;key-down
;Function Signature: key=? -> WorldState
;Purpose Statement: Increase the happiness gauge/world state by some amount when
;a key is pressed
(define (key-down ws a-key)
  (cond [(key=? a-key "down") (- ws DOWN_ARROW_HAPPINESS_VALUE)]
        [(key=? a-key "up") (+ ws UP_ARROW_HAPPINESS_VALUE)]))



(define (gauge_prog ws)
  (big-bang ws
    [on-tick tock]
    [on-key key-down]
    [to-draw render]
    [stop-when zero?]))

  