; підключення бібліотеки
(#%require scheme/vector)

; створення об'єкту vect типу vector
(define vect (vector 0 -5 6 2 -1 0))

; сортування вектору за вказаним шаблоном
(define answer (vector-append
                ; на початку числа < 0
                (vector-filter (lambda (n) (< n 0)) vect)
                ; посередені додатні числа 
                (vector-filter (lambda (n) (> n 0)) vect)
                ; в кінці нульові елементи
                (vector-filter (lambda (n) (= n 0)) vect)))

; вивід результату роботи програми
(display "Вектор до сортування: ")(display vect)
(display "\nВектор після сортування: ")(display answer)