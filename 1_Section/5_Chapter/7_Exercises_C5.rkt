;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_Exercises_C5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|

Exercise 76. Formulate data definitions for the following structure type definitions:
(define-struct movie [title producer year])

;a movie is a (make-movie String String Number)

(define-struct person [name hair eyes phone])

a person is (make-person String String String Number)

;a person is a
  Name String
  Hair String
    -"Black"
    -"Brown"
    -"Red"
    -"Blonde"
  Eyes String
    -"Brown"
    -"Blue"
    -"Green"
  Phone Number

(define-struct pet [name number])

; a pet is a (make-pet String Number)

(define-struct CD [artist title price])

a CD is a (make-CD String String Number)

(define-struct sweater [material size producer])

a sweater is a (make-sweater String String String)

Exercise 77. Provide a structure type definition and a data definition
for representing points in time since midnight.
A point in time consists of three numbers: hours, minutes, and seconds. 

(define-struct timeSinceMidnight [Hour Minute Second])

A time since midnight is (make-timeSinceMidnight Number Number Number)
An Hour is on the interval 0-23, closed on both sides/inclusive
A Minute is on the interval 0-59, closed on both sides/inclusive
A Second is on the interval 0-59, closed on both sides/inclusive
interpretation: the amount of time passed since midnight, which here,
 conceptually is the number 0:00:00

A three-letter word is a:
 -1String
   - "a" through "z" or
 -#false

(define-struct threeLetterWord [guess])

Exercise 79. Create examples for the following data definitions:
; A Color is one of:
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"

ex. red, yellow, blue

; H is a Number between 0 and 100.
; interpretation represents a happiness value

ex. 0, 1, 50, 99, 100

(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)

(make-person "Joe" "Schmoe" "#true")
(make-person "Jane" "Schwayne" "#false")

Q: Is it a good idea to use a field name that looks like the name of a predicate?
A: no?


(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)

(make-dog (make-person "Joe" "Linne" "#true") "Rog" 14 99))

; A Weapon is one of:
; — #false
; — Posn
; interpretation #false means the missile hasn't
; been fired yet; a Posn means it is in flight

ex. #false, (make-posn 12 10)
|#