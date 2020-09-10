(import (scheme base)
        (scheme write)
        (scheme lazy)
        (srfi 41))

(write
  (stream->list
    ((lambda (strm)
       (make-stream
         (delay-force (stream-promise (let () (stream-cons 1 strm))))))
     stream-null) ))

;(write (stream->list ((stream-lambda (strm) (stream-cons 1 strm)) stream-null)))
