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

;; Data Maps
(define-map projects 
  { project-id: uint } 
  { 
    name: (string-ascii 50), 
    creator: principal, 
    goal: uint, 
    deadline: uint, 
    total-raised: uint, 
    is-active: bool,
    extensions-used: uint,
    vote-end-time: uint,
    total-votes: uint,
    votes-in-favor: uint
  }
)

(define-map contributions 
  { project-id: uint, contributor: principal } 
  { amount: uint }
)

(define-map votes
  { project-id: uint, voter: principal }
  { in-favor: bool }
)

(define-data-var project-nonce uint u0)

;; Submit a new project
(define-public (submit-project (name (string-ascii 50)) (goal uint) (deadline uint))
  (let (
    (project-id (+ (var-get project-nonce) u1))
    (name-length (len name))
  )
    (asserts! (> deadline block-height) ERR_DEADLINE_PASSED)
    (asserts! (> goal u0) ERR_INSUFFICIENT_FUNDS)
    (asserts! (and (> name-length u0) (<= name-length u50)) ERR_INVALID_INPUT)
    (asserts! (is-none (map-get? projects { project-id: project-id })) ERR_ALREADY_EXISTS)
    (map-set projects
      { project-id: project-id }
      { 
        name: name, 
        creator: tx-sender, 
        goal: goal, 
        deadline: deadline, 
        total-raised: u0, 
        is-active: true,
        extensions-used: u0,
        vote-end-time: (+ deadline (* VOTING_PERIOD_DAYS u144)),
        total-votes: u0,
        votes-in-favor: u0
      }
    )
    (var-set project-nonce project-id)
    (ok project-id)
  )
)

;; Contribute to a project
(define-public (contribute (project-id uint) (amount uint))
  (let (
    (project (unwrap! (map-get? projects { project-id: project-id }) ERR_NOT_FOUND))
    (current-contribution (default-to { amount: u0 } (map-get? contributions { project-id: project-id, contributor: tx-sender })))
  )
    (asserts! (project-exists project-id) ERR_NOT_FOUND)
    (asserts! (> amount u0) ERR_INSUFFICIENT_FUNDS)
    (asserts! (get is-active project) ERR_UNAUTHORIZED)
    (asserts! (<= block-height (get deadline project)) ERR_DEADLINE_PASSED)
    (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
    (map-set contributions
      { project-id: project-id, contributor: tx-sender }
      { amount: (+ (get amount current-contribution) amount) }
    )
    (map-set projects
      { project-id: project-id }
      (merge project { total-raised: (+ (get total-raised project) amount) })
    )
    (ok true)
  )
)

