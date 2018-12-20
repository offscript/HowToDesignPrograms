;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.5 Exercises|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;2.5 Programs

(require 2htdp/batch-io)

(define (C f)
  (* 5/9 (- f 32)))

(define (convert in out)
  (write-file out
    (string-append (number->string (C (string->number read-file in))))))

#| Just a note to remember that the write-file function takes two paramters,
a file name for the file to be written and a piece of data or expression
to output|#

