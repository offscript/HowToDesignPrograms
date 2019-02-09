;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gaugeProg) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;Physical Constants
;the value that this program should intialize with
(define MAIN_WS_START 100)
(define SCENE-HEIGHT 300)
(define SCENE-WIDTH 300)
(define TOCK_HAPPINESS_VALUE .01)
(define DOWN_ARROW_HAPPINESS_VALUE .2)
(define UP_ARROW_HAPPINESS_VALUE (/ 1 3))
(define HAPPINESS-BAR-BOX-WIDTH SCENE-WIDTH)
(define HAPPINESS-BAR-BOX-HEIGHT 10)
#|The scene WIDTH is not always 100. This means that the increases and decreases
;to happiness must be adjusted given the size of the screen. If the screen is 200
 pixels, the subtractions and additions to happiness must be doubled etc.|#
(define SCENE-WIDTH-MODIFIER
  (/ SCENE-HEIGHT MAIN_WS_START))

;Graphical Constants
;Background
;Function Signature: NUMBER NUMBER -> WORLD-STATE
;Creates a scene for the kitten
(define BACKGROUND
  (empty-scene SCENE-HEIGHT SCENE-WIDTH))
;Happiness-Bar
;It's a happiness bar, based off of the worldstate
;Function Signature: worldstate (NUMBER) (Height of Box)
;HAPPINESS-BAR-BOX-WIDTH (NUMBER) (width of box)
;Purpose Statement: Takes a height and a width to
;create a rectanglular happiness bar
(define (HAPPINESS-BAR ws)
  (rectangle (* ws SCENE-WIDTH-MODIFIER) HAPPINESS-BAR-BOX-HEIGHT "solid" "red"))
;The image is placed into the scene at the image's center. Thus, we have to
;put the image into the scene at point of the image's x/2.
(define CENTER-BAR
  (/ HAPPINESS-BAR-BOX-WIDTH 2))
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
  (cond [(key=? a-key "down") (+ ws DOWN_ARROW_HAPPINESS_VALUE)]
        [(key=? a-key "up") (+ ws UP_ARROW_HAPPINESS_VALUE)]))

;render
;Function Signature: Number -> Image
;Purpose Statement: Renders an image given a ws 
(define (render ws)
  (place-image/align (HAPPINESS-BAR ws) 0 0 "left" "top" BACKGROUND))

(define (gauge-prog ws)
  (big-bang ws
    [on-tick tock]
    [on-key key-down]
    [to-draw render]
    [stop-when negative?]))

  