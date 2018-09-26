(define (make-account balance init-password)
    (let ((count 0))
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)

    (define (call-the-cops amount) "Dial 911")

    (define (dispatch password method)
        (if (eq? password init-password)
          (begin 
            (set! count 0)
            (cond ((eq? method 'withdraw) withdraw)
                  ((eq? method 'deposit) deposit)
                  (else "Unknown request"))
          )
          (if (>= count 7)
            call-the-cops
            (lambda (amount) 
              (begin (set! count (+ count 1))
              "Incorrect password"))
          )
        )

    )

  dispatch)
)