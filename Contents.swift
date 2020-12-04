
import UIKit

// Задание 3
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. структура должна содержать марку авто, год выпуска, обьем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный обьем багажника
//3. описать перечисления с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть закрыть окна, погрузить/выгрузить из кузова/багажника груз опреденного обьема
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum TrunkVolume {
    case full, empty
}

enum OfWindow {
    case open, close
}

struct SportCar {
    let color: UIColor
    let mp3: Bool
    var kg: Int
    
    let carModel: String
    var yearOfIssue: Int
    var engineStarting: Bool
    var trunkVolume: TrunkVolume
  
        mutating func fullTrunk() {
            self.trunkVolume = .full
        }
        mutating func emptyTrunk() {
            self.trunkVolume = .empty
        }
       
        func printTrankCargo() {
            if kg > 0 {
                print("в машину марки \(carModel) положили \(kg) груза")
            } else{
                print("Кузов автомобиля марки \(carModel) пустая")
            }
        }
    
    var windowAction: OfWindow
    mutating func openWindow() {
        self.windowAction = .open
    }
    mutating func closeWindow() {
        self.windowAction = .close
    }

}

struct TrunkCar {
    let color: UIColor
    let mp3: Bool
    var kg: Int
    
    let carModel: String
    var yearOfIssue: Int
    var engineStarting: Bool
    var trunkVolume: TrunkVolume
  
        mutating func fullTrunk() {
            self.trunkVolume = .full
        }
        mutating func emptyTrunk() {
            self.trunkVolume = .empty
        }
       
        func printTrankCargo() {
            if kg > 0 {
                print("в машину марки \(carModel) положили \(kg) груза")
            } else{
                print("Кузов автомобиля марки \(carModel) пустая")
            }
        }
    
    var windowAction: OfWindow
    mutating func openWindow() {
        self.windowAction = .open
    }
    mutating func closeWindow() {
        self.windowAction = .close
    }

}



var car1 = SportCar(color: .white, mp3: true, kg: 2, carModel: "Kia Sportage", yearOfIssue: 2020, engineStarting: true, trunkVolume: .full, windowAction: .close)
var trunk1 = TrunkCar(color: .red, mp3: true, kg: 200, carModel: "УРАЛ", yearOfIssue: 2019, engineStarting: true, trunkVolume: .full, windowAction: .open)

car1.printTrankCargo()

print ("Автомобиль марки \(car1.carModel), год выпуска \(car1.yearOfIssue), состояние двигателя \(car1.engineStarting), бак \(car1.trunkVolume), окна \(car1.windowAction)")

print ("цвет автомобиля \(car1.color)")

print ("Автомобиль марки \(trunk1.carModel), год выпуска \(trunk1.yearOfIssue), состояние двигателя \(trunk1.engineStarting), бак \(trunk1.trunkVolume), окна \(trunk1.windowAction)")

print ("цвет автомобиля \(trunk1.color)")
