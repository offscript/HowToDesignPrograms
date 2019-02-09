;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.4_Exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number.
; interpretation number of pixels between the top and the UFO
 
(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define CENTER (/ WIDTH 2))
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define SAUCER (ellipse 60 30 "solid" "gray"))
(define UFO (overlay/offset (circle 10 "solid" "green") 0 10 SAUCER))
 
; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]))
 
; WorldState -> WorldState
; computes next location of UFO 
(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))
;WorldState -> Image
;Shows the status of the UFO in the scene
;test
(check-expect (showText 10)
              (place-image (text "descending" 11 "green")
                           10 10
                           (render 10)))

(define (showText ws)
  (cond
    [(<= 0 y CLOSE)
     (place-image (text "descending" 11 "green"))]
    [(and (< CLOSE y) (<= y HEIGHT))
     (place-image (text "closing in" 11 "orange"))]
    [(> y HEIGHT)
     (place-image (text "landed" 11 "red"))]))
; WorldState -> Image
; places UFO at given height into the center of MTSCN
;(check-expect (render 11) (place-image UFO CENTER 11 MTSCN))
(define (render y)
  (place-image (showText y) 270 20
   (place-image UFO CENTER y MTSCN)))

; WorldState -> String
; tells the user via ??? whether or not the 