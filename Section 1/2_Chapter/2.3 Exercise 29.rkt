;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.3 Exercise 29|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 29, Thank God for Copy Paste

;Profit 1

;This is the base attendance when the show is 5 dollars per person
(define base-attendance 120)
;This is the price that produces a relative attendance of 120
(define base-price 5)
;This is the amount of attendees lost
;or gained for every 10-cent increase in price
(define base-attendance-variance 15)
;This is the increase in cost that produces a base-attendance-variance increase
;or decrease. An increase of base-cost-variance produces a decrease by the
;amount of base-attendance variance.
(define base-cost-variance .1)
;This is the fixed cost of a show
(define show-fixed-cost 180)
;This is the cost incurred per attendee of the show
(define cost-of-attendee 1.5)
;Apparently the relationship between base-attendance-variance and
;Exercise 30, 2.4
;base-cost-variance is called price sensitivity. It's a constant too. Here it is:
(define price-sensitivity (/ base-attendance-variance base-cost-variance))

(define (attendees ticket-price)
  (- base-attendance (* (- ticket-price base-price) price-sensitivity)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;cost 1.2

(define (cost1.1 ticket-price)
  (+ show-fixed-cost (* cost-of-attendee (attendees ticket-price))))

;cost 1.2

(define (cost1.2 ticket-price)
  (* cost-of-attendee (attendees ticket-price)))

(define (profit1.1 ticket-price)
  (- (revenue ticket-price)
     (cost1.1 ticket-price)))

(define (profit1.2 ticket-price)
  (- (revenue ticket-price)
     (cost1.2 ticket-price)))

;Profit 2

(define (profit2.1 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(define (profit2.2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))

(profit2.2 3)
(profit2.2 4)
(profit2.2 5)
(profit1.2 3)
(profit1.2 4)
(profit1.2 5)

