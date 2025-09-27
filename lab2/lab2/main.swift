import Foundation

// task 1

for i in 1...100 { //запускаем цикл от 1 до 100
    if i % 3 == 0 && i % 5 == 0 { //проверяем делимость на 3 и на 5
        print("FizzBuzz")
    } else if i % 3 == 0 { // проверяем делимость на 3
        print("Fizz")
    } else if i % 5 == 0 { // проверяем делимость на 5
        print("Buzz")
    } else {
        print(i) // выводим число если оно не кратно 3 и 5
    }
}

// task 2

//func isPrime(_ number: Int) -> Bool {
//    if number < 2 {return false} //1 и 0  не являются простыми числами
//    for i in 2..<number { // цикл для того чтобы пробегаться по числам и проверять делятся ли они на какое то число кроме 1 и самого себя
//        if number % i == 0 {
//            return false
//        }
//    }
//    return true // если число прошло проверку то выводим тру
//}
//
//for i in 1...100 {
//    if isPrime(i) { //проверяем каждое число в функции и если тру, то выводим число
//        print(i)
//    }
//}

// task 3

//func CtoF(_ c: Double) -> Double {
//    return (c * 9/5) + 32
//}
//
//func CtoK(_ c: Double) -> Double {
//    return c + 273.15
//}
//
//func FtoC(_ f: Double) -> Double {
//    return (f - 32) * 5/9
//}
//
//func KtoC(_ k: Double) -> Double {
//    return k - 273.15
//}
//
//func FtoK(_ f: Double) -> Double {
//    return (f - 32) * 5/9 + 273.15
//}
//
//func KtoF(_ k: Double) -> Double {
//    return (k - 273.15) * 9/5 + 32
//}
//
//print("Enter value: ", terminator: "") // просим пользователя ввести число
//if let input = readLine(), let value = Double(input) { // ввод числа
//    print("Enter unit (c/f/k): ", terminator: "") // просим пользователя ввести единицу измерения
//    if let unit = readLine() { // ввод единицы измерения
//        switch unit.uppercased() { // переводим в верхний регистр
//        case "C":
//            print("Celsius: \(value)")
//            print("Fahrenheit: \(CtoF(value))")
//            print("Kelvin: \(CtoK(value))")
//        case "F":
//            print("Fahrenheit: \(value)")
//            print("Celsius: \(FtoC(value))")
//            print("Kelvin: \(FtoK(value))")
//        case "K":
//            print("Kelvin: \(value)")
//            print("Celsius: \(KtoC(value))")
//            print("Fahrenheit: \(KtoF(value))")
//        default:
//            print("Error!") // если ввел что то не то - ошибка
//        }
//    }
//}

// task 4

//var shoppingList: [String] = [] // создаем массив для хранения списка продуктов
//var isRunning = true // условие работы цикла
//
//while isRunning { // запуск цикла для работы кода
//    print("""
//    Shopping List Manager
//    1. Add item
//    2. Remove item
//    3. Show list
//    4. Exit
//    Choose an option: 
//    """, terminator: "")
//    
//    if let choice = readLine() {
//        switch choice {
//        case "1":
//            print("Enter item to add: ", terminator: "")
//            if let item = readLine(), !item.isEmpty { // ввод продукта и проверка не пустая ли строка
//                shoppingList.append(item) // добавление в массив
//                print("\(item) added to the list.\n")
//            }
//        case "2":
//            print("Enter item to remove: ", terminator: "")
//            if let item = readLine(), let index = shoppingList.firstIndex(of: item) { // ввод продукта и выявление его индекса
//                shoppingList.remove(at: index) // удаление продукта из массива по его индексу
//                print("\(item) removed from the list.\n")
//            } else {
//                print("Item not found!\n")
//            }
//        case "3":
//            print("Current Shopping List")
//            if shoppingList.isEmpty {
//                print("List is empty.\n")
//            } else {
//                for (index, item) in shoppingList.enumerated() { // цикл для вывода всех продуктов из массива
//                    print("\(index + 1). \(item)")
//                }
//                print()
//            }
//        case "4":
//            isRunning = false
//        default:
//            print("Error!\n")
//        }
//    }
//}

// task 5

//print("Enter sentence: ", terminator: "")
//if let input = readLine() {
//    let cleaned = input.lowercased().filter { $0.isLetter || $0.isWhitespace } // переводим в нижний регистр и убираем знаки препинания
//    let words = cleaned.split(separator: " ") // разбиваем на слова
//    var wordCount: [String: Int] = [:] // дикшинари для подсчета слов
//    for word in words {
//        let w = String(word) // превращаем каждое слово в строку
//        wordCount[w, default: 0] += 1
//    }
//    for (word, count) in wordCount {
//        print("\(word): \(count)")
//    }
//}

// task 6

//func fibonacci(_ n: Int) -> [Int] {
//    if n <= 0 { return [] }
//    if n == 1 { return [0] }
//    if n == 2 { return [0, 1] }
//    
//    var sequence = [0, 1]
//    for i in 2..<n {
//        let next = sequence[i - 1] + sequence[i - 2]
//        sequence.append(next)
//    }
//    return sequence
//}
//
//print("Enter number: ", terminator: "")
//if let input = readLine(), let number = Int(input) {
//    print(fibonacci(number))
//}

// task 7

//let students: [String: Int] = [
//    "Rassul": 100,
//    "Rassul 2.0": 90,
//    "Rassul 3.0": 80,
//    "Rassul 4.0": 70
//]
//
//let scores = Array(students.values) // добавляем все баллы в один массив
//let average = Double(scores.reduce(0, +)) / Double(scores.count) // вычисляем средний балл
//let maxScore = scores.max() ?? 0 // вычисляем максимальный балл
//let minScore = scores.min() ?? 0 // вычисляем минимальный балл
//
//print("Average score: \(average)")
//print("Highest score: \(maxScore)")
//print("Lowest score: \(minScore)")
//
//for (name, score) in students {
//    var status: String // сравниваем каждый балл со средним
//    if score >= Int(average) {
//        status = "above average"
//    } else {
//        status = "below average"
//    }
//    print("\(name): \(score) (\(status))")
//}

// task 8

//func isPalindrome(_ text: String) -> Bool {
//    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
//    return cleaned == String(cleaned.reversed())
//}
//
//if let input = readLine() {
//    print(isPalindrome(input))
//}

// task 9
//
//func sum(_ a: Double, _ b: Double) -> Double {
//    return a + b
//}
//
//func minus(_ a: Double, _ b: Double) -> Double {
//    return a - b
//}
//
//func multiply(_ a: Double, _ b: Double) -> Double {
//    return a * b
//}
//
//func divide(_ a: Double, _ b: Double) -> Double {
//    if b == 0 {
//        print("Error: Division by zero") // на ноль делить нельзя
//        return 0
//    }
//    return a / b
//}
//
//while true {
//    print("Enter first number (or type 'exit'): ", terminator: "")
//    guard let input1 = readLine() else { continue }
//    if input1.lowercased() == "exit" { break } // при вводе exit останавливать цикл
//    guard let n1 = Double(input1) else {
//        continue
//    }
//    
//    print("Enter second number: ", terminator: "")
//    guard let input2 = readLine(), let n2 = Double(input2) else {
//        continue
//    }
//    
//    print("Choose operation (+, -, *, /): ", terminator: "")
//    let op = readLine() ?? ""
//    
//    var result: Double?
//    switch op {
//    case "+": result = sum(n1, n2)
//    case "-": result = minus(n1, n2)
//    case "*": result = multiply(n1, n2)
//    case "/": result = divide(n1, n2)
//    default: print("Error")
//    }
//    
//    if let r = result {
//        print("Result: \(r)")
//    }
//}

// task 10

//func hasUniqueCharacters(_ text: String) -> Bool {
//    var seen: Set<Character> = [] // сет для уже встреченных символов
//    
//    for char in text {
//        if seen.contains(char) {
//            return false //если символ уже встречался выводим фолс
//        }
//        seen.insert(char)//или добавляем символ в сет
//    }
//    
//    return true //если повторов нет, выводим тру
//}
//
//if let input = readLine() {
//    print(hasUniqueCharacters(input))
//}

