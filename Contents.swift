import UIKit

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/

enum windows{
    case open
    case closed
}
enum engine{
    case on
    case off
}
enum nitro{
    case nitroOn
    case nitroOff
}
enum luggage{
    case trunkIsFull
    case TrunkIsEmpty
}
protocol Car {
    var brand: String {get}
    var release: Int {get}
    var engineState: engine {get set}
    var windowsState: windows {get set}
}
extension Car {
    mutating func changeEngineState(engineState: engine){
        self.engineState = engineState
    }
    mutating func chageWindowsState(windowsState: windows){
        self.windowsState = windowsState
    }
}
class basicCar: Car{
    var brand: String
    var release: Int
    var engineState: engine = .off
    var windowsState: windows = .closed
    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
    }
}
class sportCar: basicCar, CustomStringConvertible{
    var nitroState: nitro = .nitroOff
    var description: String{
        return "engine is \(engineState), windows is \(windowsState), nitro is \(nitroState), release date is \(release)"
    }
}
class trunkCar: basicCar, CustomStringConvertible{
    var trunkState: luggage = .TrunkIsEmpty
    var description: String{
        return "engine is \(engineState), windows is \(windowsState), trunk is \(trunkState), release date is \(release)"
    }
}
var mitsubisi = sportCar(brand: "Митсубиши", release: 2019)
var gazel = trunkCar(brand: "Газель", release: 2005)
mitsubisi.changeEngineState(engineState: .on)
mitsubisi.nitroState = .nitroOn
gazel.chageWindowsState(windowsState: .open)
gazel.trunkState = .trunkIsFull
print(mitsubisi.description)
print(gazel.description)

