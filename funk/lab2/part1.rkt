(display "Клим Липовський ІПЗ-41. Лаб 2. Варіант 9. Частина 1.\n")

; факторіал
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

; звичайна реалізація tg = sin/cos
(define (tg x)
  (/ (sin x)(cos x))
  )

; sin та cos через ряд тейлора
(define (tailor-sin-cos x i n)
  (if (>= i n)
      0
      (- (/(expt x i) (factorial i)) (tailor-sin-cos x (+ i 2) n))
      )
  )
; реалізація tg = sin/cos через ряд тейлора
(define (tailor-tg x)
  (/ (tailor-sin-cos x 1 20) (tailor-sin-cos x 0 20))  ; ряд чейлора sin та cos залежать від початкової i
  )

; надана функція з параметрами x та функцією tg, яка буде використовуватись у розрахунках
(define (f x tg)
  (cond
    ((and (<= -2 x)( < x 0))(/ (- (tg x)(/ x 2)) (tg (* 2 x))))
    ((and (< 0 x)( <= x 2))(- (tg (+ x 2)) (expt (tg x) 2)))
    )
  )

; Вивід на екран відповіді
(define error 0)  ; загальна помилка
(define goodExamples 0)  ; кількість вдалих виконань
(define start -3)  ; початкове значення x
(define end 3)  ; кінцеве значення x
(define step 0.5)  ; крок збільшення x

; функція для виводу відповіді на екран
(define (answer)
  ; реалізація tg через ряд тейлора
  (display "\nTailor tg F(")(display start)(display "): ")(display (f start tailor-tg))
  ; реалізація tg вбудована в racker
  (display "\nTg F(")(display start)(display "): ")(display (f start tailor-tg))
  (display "\n")

  ; перевірка чи відповідь функції є числовою
  (cond ((and (NUMBER? (f start tailor-tg)) (NUMBER? (f start tg)))
         ; додавання до загальної помилки локальної, якщо відповіді є числовими
         (set! error (+ error (- (f start tailor-tg) (f start tg))))
         (display "Error: ")
         (display (- (f start tailor-tg) (f start tg)))
         (display "\n")
         (set! goodExamples (+ goodExamples 1))))
  (set! start (+ start step))
  ; закінчення рекурсивного виводу відповіді, якщо start = step
  (if (> start step)
      (display "\nEnd\n\n")
      (answer))
  )

; запуск виводу відповіді
(answer)

; Вивід середньої помилки
(display "Average error: ")(display (/ error goodExamples))




