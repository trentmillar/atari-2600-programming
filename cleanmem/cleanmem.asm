  processor 6502
  
  seg code
  org $F000 ; define the code origin at $F000
  
start:
  sei       ; disable interupts
  cld       ; disable decimal/bcd math mode
  ldx #$FF  ; load the x register with #$ff
  txs       ; transfer the x register to the stack pntr register
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the page zero region - $00 - $ff
;   entire ram clear and TIA clear

  lda #0    ; A = 0
  ldx #$FF  ; X = #$FF
  
memloop:
  sta $0,X    ; store a inside 0 + X
  dex         ; x--
  bne memloop ; x != 0 memloop
  
  org $FFFC
  .word start ; reset address set ROM end to start
  .word start ; interupt address
