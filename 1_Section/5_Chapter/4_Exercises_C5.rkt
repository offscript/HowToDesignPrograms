;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define ballf1 (make-ball 30 40 -10 5))

;Nested Structures

;A centry is a cell entry, I take it.
(define-struct centry [name home office cell])
(define-struct phone [area number])
(make-centry "Miss Ava" (make-phone 207 "443-231")
             (make-phone 207 "332-3984")
             (make-phone 207 "863-2365"))
