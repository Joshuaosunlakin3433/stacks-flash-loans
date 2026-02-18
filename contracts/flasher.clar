(use-trait ft-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)
(use-trait stx-flasher .flashloans-trait.stx-flasher)
(use-trait sip010-flasher .flashloans-trait.sip010-flasher)

(define-constant THIS_CONTRACT (as-contract tx-sender))
(define-constant STX_FLASH_FEES_PIPS u5000) ;; 5000 pips = 0.5% interest
(define-constant SIP010_FLASH_FEES_PIPS u10000) ;; 10000 pips = 1% interest

(define-constant ERR_INSUFFICIENT_BALANCE (err u101))
(define-constant ERR_OUTBOUND_TRANSFER_FAILED (err u102))
(define-constant ERR_FLASHER_CALLBACK_FAILED (err u103))
(define-constant ERR_INBOUND_TRANSFER_FAILED (err u104))
(define-constant ERR_INSUFFICIENT_PAYBACK (err u105))
(define-constant ERR_FAILED_TO_FETCH_BALANCE (err u106))

;; Flash a STX amount to a recipient contract that implements the stx-flasher trait
;; Verifies that it gets paid back the amount plus interest by the end of the call
;; Reverts the transaction if the recipient contract fails to pay back the amount plus interest

(define-public (flash-stx
        (amount uint)
        (recipient <stx-flasher>)
    )
    ;; TO-DO
    (ok true)
)

;; Flash a SIP010 token amount to a recipient contract that implements the sip010-flasher trait
;; Verifies that it gets paid back the amount plus interest by the end of the call
;; Reverts the transaction if the recipient contract fails to pay back the amount plus interest

(define-public (flash-sip010
        (token <ft-trait>)
        (amount uint)
        (recipient <sip010-flasher>)
    )
    ;; TO-DO
    (ok true)
)

;; Given an amount and interest fees being charged, calculates the return amount
(define-private (get-return-amount
        (amount uint)
        (fees-pips uint)
    )
    (let (
            (interest (/ (* amount fees-pips) u1000000))
            (return-amount (+ amount interest))
        )
        return-amount
    )
)  

