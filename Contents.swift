import UIKit


//1. Написать функцию, которая определяет, четное число или нет.

func getEvenNumber(number: Int) -> String {
    return number % 2 == 0 ? "Число \(number) четное" : "Число \(number) нечетное"
}

print(getEvenNumber(number: 2))
print("--------")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func getOddNumber(number: Int) -> String {
    return number % 3 == 0 ? "Число \(number) делится на 3" : "Число \(number) не делится на 3, остаток: \(number % 3)"
}

print(getOddNumber(number: 4))
print("--------")


//3. Создать возрастающий массив из 100 чисел.

let startNumber: Int = 108 // Начальное число массива
func getHundredNums(_ startNumber: Int) -> Array<Int> {
    var hundredArray: Array<Int> = [];

    for num in startNumber..<(100 + startNumber) {
        hundredArray.append(num)
    }

    return hundredArray
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func getNumbers(_ array: Array<Int>) -> [String:Array<Int>] {
    let evenNums = array.filter{$0 % 2 == 0}
    let oddNums = array.filter{$0 % 3 == 0}
    let otherNums = array.filter{$0 % 2 != 0 && $0 % 3 != 0}

    return ["evenNums": evenNums, "oddNums": oddNums, "otherNums": otherNums]
}

let numbersDict: [String:Array<Int>] = getNumbers(getHundredNums(startNumber))

print("Четные числа:\n", numbersDict["evenNums"]!)
print("====")
print("Нечетные числа:\n", numbersDict["oddNums"]!)
print("====")
print("Нечетные, не делятся на 3:\n", numbersDict["otherNums"]!)
print("--------")


//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.


var fibonacciNums = [Int]()

func fibonacci(n: Int) -> Int {
    var a = 0
    var b = 1
    for _ in 0..<n {
         let temp = a
         a = b
         b = temp + b
     }
    return a
}

func arrayIntAppend(n: Int) -> [Int] {
    var array = [Int]()
    for i in 0..<n {
        array.append(fibonacci(n: i))
    }
    return array
}
arrayIntAppend(n: 50)

print("Числа Фибоначчи:\n", arrayIntAppend(n: 50))
print("--------")

//2 вариант выполнения 5 задания
//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(100))
print("--------")

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

var simpleNumbers: Array<Int> = []

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains{ number % $0 == 0 }
}

for number in getHundredNums(1) {
    if isPrime(number) {
        simpleNumbers.append(number)
    }
}

print("Простые числа:\n", simpleNumbers)
print("--------")

//2 вариант выполнения 6 задания
//6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))

