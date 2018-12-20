;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.5 Exercises|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;2.5 Programs

(require 2htdp/batch-io)

(define (C f)
  (* 5/9 (- f 32)))

(define (convert in out)
  (write-file out
    (string-append (number->string (C (string->number (read-file in))))
      "\n")
    )
  )

#| Just a note to remember that the write-file function takes two paramters,
a file name for the file to be written and a piece of data or expression
to output|#

;Variables
(write-file "in-fst.dat" "Thomas")
(write-file "in-lst.dat" "William")
(write-file "in-signature.dat" "Keating")
(define in-fst "in-fst.dat")
(define in-lst "in-lst.dat")
(define in-signature "in-signature.dat")
(define out-name "out.dat")

;Function Defintions
(define (letter fst lst signature-name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

(main in-fst in-lst in-signature out-name)


