;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.6_Taxes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)

; A Price falls into one of three intervals: 
; — 0 through 999
; — 1000 through 9999
; — 10000 and above.
; interpretation the price of an item  

;Tests
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 999) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 5000) (* 0.05 5000))
(check-expect (sales-tax 9999) (* 0.05 9999))
(check-expect (sales-tax 12000) (* 0.08 12000))
(check-expect (sales-tax 12017) (* 0.08 12017))

;Tax Constants
(define (low-tax-bracket? p) (and (<= 1000 p) (< p 10000)))
(define (high-tax-bracket? p) (>= p 10000))

; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(low-tax-bracket? p) (* 0.05 p)]
    [(high-tax-bracket? p) (* 0.08 p)]))