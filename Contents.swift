import UIKit
//Задание 7
//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


//создадим протокол Error, который применяется к пеерчислениям, превращая их в перечисление вариантов ошибок

//вариант 1 - Вендинговая машина

enum VendingMachineError: Error { //ошибки автомата
    
    case invalidSelection //нет в асортименте
    case outOfStock //нет в наличии
    case insufficientFunds(coinsNeeded: Int) //недостаточно денег, передаем недостаточную сумму
}

//позиция в автомате
struct Item {
    var price: Int
    var count: Int
    let product: Product
}

//товар
struct Product {
    let name: String
}

//вендинговая машина
    class VendingMachine {
        //Хранилище
        var inventory = [
            "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
            "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
            "Pretzels": Item(price: 10, count: 11, product: Product(name: "Pretzels"))
        ]
        //Количество денег, переданное покупателем
            var coinsDeposited = 0
        // Продаем товар
            func vend(itemNamed name: String) throws  -> Product {
            // Возвращаем кортеж из товара и ошибки
            //Если наша машина не знает такого товара вообще
                guard let item = inventory[name] else {
                    //возвращаем nil вместо продукта и ошибку
                    //return (nil, VendingMachineError.invalidSelection)
                    throw VendingMachineError.invalidSelection
                }
            
            //Если товара нет в наличии
                guard item.count > 0 else {
                    //возвращаем nil вместо продукта и ошибку
                    //return (nil, VendingMachineError.outOfStock)
                    throw VendingMachineError.outOfStock
                }
            
            //Если недостаточно денег
            
                guard item.price <= coinsDeposited else {
                    //возвращаем nil вместо продукта и ошибку
                    //return (nil, VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited))
                    throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
                }
            
                //продаем товар
                coinsDeposited -= item.price
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
                
                //возвращаем продукт
                
                return newItem.product
            }
    }

let vendingMachine = VendingMachine()

do {
    // помечаем метод как try и помещаем его вызов в блок do
    let sell1 = try vendingMachine.vend(itemNamed: "Snikers")
   
} catch VendingMachineError.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}
    
do {
    // помечаем метод как try и помещаем его вызов в блок do
    let sell2 = try vendingMachine.vend(itemNamed: "Candy Bar")
   
} catch VendingMachineError.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

do {
    // помечаем метод как try и помещаем его вызов в блок do
    let sell3 = try vendingMachine.vend(itemNamed: "Pretzels")
   
} catch VendingMachineError.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

    
    
//let sell1 = vendingMachine.vend(itemNamed: "Snikers") // nil, invalidSelection
//let sell2 = vendingMachine.vend(itemNamed: "Candy Bar") // nil, insufficientFunds, 12
//let sell3 = vendingMachine.vend(itemNamed: "Pretzels") // Product "Pretzels", nil

//if let product = sell1.0 {
   // print("Мы купили: \(product.name)")
//} else if let error = sell1.1 {
   // print("Произошла ошибка: \(error.localizedDescription)")
//}



//вариант 2 - ошибки на космическом корабле
/*
enum spaceShuttleErros: Error{
    case engineIsBroken
    case oxygenIsLeaking
}
class spaceShuttle{
    var engine: Bool
    var oxygen: Int
    init(engine: Bool, oxygen: Int){
        self.engine = engine
        self.oxygen = oxygen
    }
    func oxygenState() throws{
        if oxygen < 10{
            throw spaceShuttleErros.oxygenIsLeaking
        }
    }
    func engineState() throws{
        if engine == false{
                throw spaceShuttleErros.engineIsBroken
        }
    }
}
var discovery = spaceShuttle(engine: false, oxygen: 1)
do{
   try discovery.oxygenState()
} catch spaceShuttleErros.oxygenIsLeaking{
    print("Не хватает кислорода")
}
do{
    try discovery.engineState()
} catch spaceShuttleErros.engineIsBroken{
    print("Отказал двигатель")
}
*/

