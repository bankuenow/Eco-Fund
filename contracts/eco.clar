;; EcoFund: Decentralized Crowdfunding for Environmental Conservation

;; Constants
(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_NOT_FOUND (err u201))
(define-constant ERR_ALREADY_EXISTS (err u202))
(define-constant ERR_INSUFFICIENT_FUNDS (err u203))
(define-constant ERR_DEADLINE_PASSED (err u204))
(define-constant ERR_GOAL_NOT_REACHED (err u205))
(define-constant ERR_INVALID_INPUT (err u206))
(define-constant ERR_CONTRIBUTIONS_EXIST (err u207))
(define-constant ERR_EXTENSION_NOT_ALLOWED (err u208))
(define-constant ERR_VOTING_PERIOD_NOT_ENDED (err u209))
(define-constant ERR_VOTING_THRESHOLD_NOT_MET (err u210))

;; Configuration
(define-constant EXTENSION_THRESHOLD u80) ;; 80% of the goal
(define-constant MAX_EXTENSION_DAYS u45)
(define-constant VOTING_PERIOD_DAYS u10)
(define-constant MIN_VOTE_THRESHOLD_PERCENT u70) ;; 70% of votes must be in favor
(define-constant MIN_VOTE_COUNT_THRESHOLD u15) ;; At least 15 votes required