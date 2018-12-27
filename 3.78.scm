(define (solve-2nd a b dt y0 dy0)
  (let (y (integral (delay dy) y0 dt))
       (dy (integral (delay ddy) dy0 dt))
       (ddy (add-streams (scale-stream dy a)
                         (scale-stream y b)))
   y))