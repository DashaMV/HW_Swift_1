
import UIKit

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

enum nitro{
    case nitroOn
    case nitroOff
}
enum luggage{
    case trunkIsFull
    case TrunkIsEmpty
}
class Car{
    var brand: String
    var release: Int
    init(brand: String, release: Int){
        self.brand = brand
        self.release = release
    }
}
class trunkCar: Car{
    var trunk: luggage
    init(brand: String, release: Int, trunk: luggage){
        self.trunk = trunk
        super.init(brand: brand, release: release)
    }
    func trunkState(){
        if trunk == .trunkIsFull {
            print("Багажник полон")
        } else{
            print("Багажник пуст")
        }
    }
}
class sportCar: Car{
    var goFast: nitro
    init(brand: String, release: Int, goFast: nitro){
        self.goFast = goFast
        super.init(brand: brand, release: release)
    }
    func nitroState(){
        if goFast == .nitroOn {
            print("Спортивная машина едет быстрее")
        } else{
            print("Спортивная машина едет медленее")
        }
    }
}
let gazel = trunkCar(brand: "Газель", release: 2005, trunk: .trunkIsFull)
gazel.trunkState()
let mitsubisi = sportCar(brand: "Митсубиши", release: 2019, goFast: .nitroOn)
mitsubisi.nitroState()
