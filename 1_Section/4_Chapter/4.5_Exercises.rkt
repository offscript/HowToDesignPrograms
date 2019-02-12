;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.5_Exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;Natural Physical Constants
(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)

;Natural Graphical Constants
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

;Computed Graphical Constants, ratios
(define CENTER (/ (image-height ROCKET) 2))

;show
; LRCD -> Image
; renders the state as a resting or flying rocket

;show helper functions

(define (place-rocket x)
  (place-image ROCKET 10 (- x CENTER) BACKG))

(define (show-text x)
  (text (number->string x) 20 "red"))

;show tests

;tests
(check-expect
 (show "resting")
 (place-image ROCKET 10 ( - HEIGHT CENTER) BACKG))
 
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET 10 ( - HEIGHT CENTER) BACKG)))
 
(check-expect
 (show 53)
 (place-image ROCKET 10 ( - 53 CENTER) BACKG))

(check-expect
 (show HEIGHT)
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(check-expect
 (show 0)
 (place-image ROCKET 10 (- 0 CENTER) BACKG))

;show final-function
(define (show x)
 (cond
   [(string? x)
    (place-rocket HEIGHT)]
   [(<= -3 x -1)
    (place-image (show-text x) 10 (* 3/4 WIDTH) (place-rocket HEIGHT))]
   [(>= x 0)
    (place-rocket x)]))


; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
;tests
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)

;final function
(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))
 
; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already

;tests
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))

;final function
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

;stop-when partner
(define (exit? x)
  (cond
    [(string? x) #false]
    [(<= -3 x -1) #false]
    [(> x 0) #false]
    [(= x 0) #true]))

;main
; LRCD -> LRCD
(define (main1 s)
  (big-bang s
    [to-draw show]
    [on-key launch]))

(define (main2 s)
  (big-bang s
    [on-tick fly 1]
    [to-draw show]
    [on-key launch]
    [stop-when exit? show]))
