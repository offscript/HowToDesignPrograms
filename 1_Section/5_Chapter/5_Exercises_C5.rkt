;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct movie [title producer year])
(make-movie "Forrest Gump" "A Dude" 1994)
(define-struct person [name hair eyes phone])
(make-person "Thomas" "black" "brown" "240-688-1958")
(define-struct pet [name number])
(make-pet "Dickens" 1225464)
(define-struct CD [artist title price])
(make-CD "Earl Sweatershirt" "Some Rap Songs" 12)
(define-struct sweater [material size producer])
(make-sweater "cotton" "large" "GAP")

#|
Sample Problem Develop a structure type definition for a program that deals with
“bouncing balls,” briefly mentioned at the very beginning of this chapter.
The ball’s location is a single number, namely the distance of pixels from the top.
Its constant speed is the number of pixels it moves per clock tick.
Its velocity is the speed plus the direction in which it moves.
|#

(define-struct ball [location velocity])
(define-struct vel [deltax deltay])
(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))


;Exercise 68
(define-struct ballf [x y deltax deltay])
(define ballf1 (make-ballf 30 40 -10 5))

;Nested Structures

;A centry is a cell entry, I take it.
(define-struct centry [name home office cell])
(define-struct phone [area number])
(make-centry "Miss Ava" (make-phone 207 "443-231")
             (make-phone 207 "332-3984")
             (make-phone 207 "863-2365"))

;Example
(ball-velocity ball1)
(vel-deltax (ball-velocity ball1))

#| Exercise 70 Laws
(define-struct centry [name home office cell])

(centry-name (make-centry name0 home0 office0 cell0)) == name0
(centry-home (make-centry name0 home0 office0 cell0)) == home0
(centry-office (make-centry name0 home0 office0 cell0)) == office0
(centry-cell (make-centry name0 home0 office0 cell0)) == cell0 

(define-struct phone [area number])

(phone-area (make-phone area0 number0)) == area0
(phone-number (make-phone area0 number0)) == number0


|#

(phone-area
 (centry-office
  (make-centry "Shriram Fisler"
    (make-phone 207 "363-2421")
    (make-phone 101 "776-1099")
    (make-phone 208 "112-9981"))))

;Exercise 71

; distances in terms of pixels:
(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
(define WIDTH  400)
(define CENTER (quotient WIDTH 2))
 
(define-struct game [left-player right-player ball])
 
(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))

(game-ball game0)
(posn? (game-ball game0))
(game-left-player game0)


                                   



