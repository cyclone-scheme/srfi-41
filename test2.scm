(import (scheme base)
        (scheme write)
        (scheme lazy)
        (srfi 41))

;(write
;  (stream->list
;    ((lambda (strm)
;       (make-stream
;         (delay-force (stream-promise (let () (stream-cons 1 strm))))))
;     stream-null) ))

;; blows up when %stream-cdr tries to operate on a
;; promise instead of a vector (IE, record type). WTF??? 
(write (stream->list
             (make-stream
               (make-promise
                 (lambda ()
                   (stream-promise
                     ((lambda ()
                        (make-stream
                          (make-promise
                            (make-stream-pair
                              (make-promise (lambda () 1))
                              (make-promise
                                (lambda () (stream-promise stream-null)))))))) ))))))

;(write (stream->list ((stream-lambda (strm) (stream-cons 1 strm)) stream-null)))
(newline)
(write (stream->list (stream-cons 1 stream-null)))
