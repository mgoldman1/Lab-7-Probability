(load "charmodel.scm")

;Model 1

(define original-1 "/home/weinman/courses/CSC261/data/mills/original/1.txt")
(define original-8 "/home/weinman/courses/CSC261/data/mills/original/8.txt")
(define original-16 "/home/weinman/courses/CSC261/data/mills/original/16.txt")
(define corrupted-1 "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/16.txt")
(define corrupted-8 "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/16.txt")
(define corrupted-16 "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/16.txt")

(define original-4 "/home/weinman/courses/CSC261/data/mills/original/4.txt")
(define original-9 "/home/weinman/courses/CSC261/data/mills/original/9.txt")
(define original-18 "/home/weinman/courses/CSC261/data/mills/original/18.txt")
(define corrupted-4 "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/4.txt")
(define corrupted-9 "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/9.txt")
(define corrupted-18 "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/18.txt")

(define run-count-conditionals
  (lambda (o c count)
    (count-conditionals! o c count)
    count))

(define run-norm-counts
  (lambda (counts)
    (normalize-counts! counts) counts))

(define train
  (lambda (original corrupted counts)
    (let loop ([o original] [c corrupted] [count counts])
      (if (and (equal? (list ) o) (equal? (list ) c))
          (run-norm-counts count)
          (loop (cdr o) (cdr c) (run-count-conditionals (car o) (car c) count))))))


;; First section of analysis.
;;
;; Training two models, one for each typist, and comparing the results
;; when tested on the same letter with a known author.

; train typist 1 model on letter 1 
(define typist-1-1 (create-counts 28 1))
(train (list original-1)
       (list corrupted-1)
       typist-1-1)
; train typist 2 model on letter 4
(define typist-2-4 (create-counts 28 1))
(train (list original-4)
       (list corrupted-4)
       typist-2-4)
; train typist 1 model on letter 8 
(define typist-1-8 (create-counts 28 1))
(train (list original-8)
       (list corrupted-8)
       typist-1-8)
; train typist 2 model on letter 9
(define typist-2-9 (create-counts 28 1))
(train (list original-9)
       (list corrupted-9)
       typist-2-9)
; train typist 1 model on letter 16 
(define typist-1-16 (create-counts 28 1))
(train (list original-16)
       (list corrupted-16)
       typist-1-16)
; train typist 2 model on letter 18
(define typist-2-18 (create-counts 28 1))
(train (list original-18)
       (list corrupted-18)
       typist-2-18)

; Test letter 1
(display "Testing on letter 1, typist 1 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-1 corrupted-1 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-1 corrupted-1 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-1 corrupted-1 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-1 corrupted-1 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-1 corrupted-1 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-1 corrupted-1 typist-2-18)
(newline)
; Test letter 4
(display "Testing on letter 4, typist 2 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-4 corrupted-4 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-4 corrupted-4 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-4 corrupted-4 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-4 corrupted-4 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-4 corrupted-4 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-4 corrupted-4 typist-2-18)
(newline)
; Test letter 8
(display "Testing on letter 8, typist 1 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-8 corrupted-8 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-8 corrupted-8 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-8 corrupted-8 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-8 corrupted-8 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-8 corrupted-8 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-8 corrupted-8 typist-2-18)
(newline)
; Test letter 9
(display "Testing on letter 9, typist 2 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-9 corrupted-9 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-9 corrupted-9 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-9 corrupted-9 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-9 corrupted-9 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-9 corrupted-9 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-9 corrupted-9 typist-2-18)
(newline)
; Test letter 16
(display "Testing on letter 16, typist 1 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-16 corrupted-16 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-16 corrupted-16 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-16 corrupted-16 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-16 corrupted-16 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-16 corrupted-16 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-16 corrupted-16 typist-2-18)
(newline)
; Test letter 18
(display "Testing on letter 18, typist 2 ...")(newline)
(display "Typist-1-1:")(log-likelihood original-18 corrupted-18 typist-1-1)
(display "Typist-1-8:")(log-likelihood original-18 corrupted-18 typist-1-8)
(display "Typist-1-16:")(log-likelihood original-18 corrupted-18 typist-1-16)
(display "Typist-2-4:")(log-likelihood original-18 corrupted-18 typist-2-4)
(display "Typist-2-9:")(log-likelihood original-18 corrupted-18 typist-2-9)
(display "Typist-2-18:")(log-likelihood original-18 corrupted-18 typist-2-18)
(newline)

; Second section of analysis
;
;Train models on two letters of same typist and then check third letter against two trained ones 


;Train 1 and 8
(define typist-1-1-8 (create-counts 28 1))
(train (list original-1 original-8)
       (list corrupted-1 corrupted-8)
       typist-1-1-8)
;Train 4 and 9
(define typist-2-4-9 (create-counts 28 1))
(train (list original-4 original-9)
       (list corrupted-4 corrupted-9)
       typist-2-4-9)
;guess 16
(display "Testing on letter 16, typist 1 ...")(newline)
(display "Typist-1-1-8:")(log-likelihood original-16 corrupted-16 typist-1-1-8)
(display "typist-2-4-9")(log-likelihood original-16 corrupted-16 typist-2-4-9)
;guess 18
(display "Testing on letter 18, typist 2 ...")(newline)
(display "Typist-1-1-8:")(log-likelihood original-18 corrupted-18 typist-1-1-8)
(display "typist-2-4-9")(log-likelihood original-18 corrupted-18 typist-2-4-9)


;Train 1 and 16
(define typist-1-1-16 (create-counts 28 1))
(train (list original-1 original-16)
       (list corrupted-1 corrupted-16)
       typist-1-1-16)
;Train 4 and 18
(define typist-2-4-18 (create-counts 28 1))
(train (list original-4 original-18)
       (list corrupted-4 corrupted-18)
       typist-2-4-18)
;guess 8
(display "Testing on letter 8, typist 1 ...")(newline)
(display "Typist-1-1-16")(log-likelihood original-8 corrupted-8 typist-1-1-16)
(display "typist-2-4-18")(log-likelihood original-8 corrupted-8 typist-2-4-18)
;guess 9
(display "Testing on letter 9, typist 2 ...")(newline)
(display "Typist-1-1-16")(log-likelihood original-9 corrupted-9 typist-1-1-16)
(display "typist-2-4-18")(log-likelihood original-9 corrupted-9 typist-2-4-18)


;Train 8 and 16
(define typist-1-8-16 (create-counts 28 1))
(train (list original-8 original-16)
       (list corrupted-8 corrupted-16)
       typist-1-8-18)
;Train 9 and 18
(define typist-2-9-18 (create-counts 28 1))
(train (list original-9 original-18)
       (list corrupted-9 corrupted-18)
       typist-1-9-18)
;guess 1
(display "Testing on letter 1, typist 1 ...")(newline)
(display "Typist-1-8-16:")(log-likelihood original-1 corrupted-1 typist-1-8-16)
(display "typist-2-9-18")(log-likelihood original-1 corrupted-1 typist-2-9-18)
;guess 4
(display "Testing on letter 4, typist 2 ...")(newline)
(display "Typist-1-8-16:")(log-likelihood original-4 corrupted-4 typist-1-8-16)
(display "typist-2-9-18")(log-likelihood original-4 corrupted-4 typist-2-9-18)







