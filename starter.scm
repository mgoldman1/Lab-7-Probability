(load "charmodel.scm")

(define original "/home/weinman/courses/CSC261/data/mills/original/16.txt")
(define corrupted "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/16.txt")
(define original-1 "/home/weinman/courses/CSC261/data/mills/original/8.txt")
(define corrupted-1 "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/8.txt")

(define original-2 "/home/weinman/courses/CSC261/data/mills/original/4.txt")
(define corrupted-2 "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/4.txt")

;B1-10
(define counts (create-counts 28 1))

(count-conditionals! original corrupted counts)

(define f-index (char->index #\f))
(define g-index (char->index #\g))

(normalize-counts! counts)
(get-count counts f-index g-index)

(log-likelihood original-1 corrupted-1 counts)

;B12-14
(define counts-1 (create-counts 28 1))
(count-conditionals! original-2 corrupted-2 counts-1)
(normalize-counts! counts-1)
(get-count counts-1 f-index g-index)
(log-likelihood original-2 corrupted-2 counts-1)

