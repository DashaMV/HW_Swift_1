import UIKit
import Foundation
import Cocoa

//Сделали запрос
//получили сырые данные
//сырые данные обработали - > данные для отображения
//передали структуру в элемент, который нужно отобразить
//профит

/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.*/


enum engineState { // 3. описываем перечисления запустить/заглушить двигатель
    case start, stop
}

enum windowState { //3. описываем перечисления открыть/закрыть окна
    case open, close
}

enum trunkState { //3. описываем перечисления огрузить/выгрузить из кузова/багажника груз определенного объема
    case full, empty
}

struct someCar { //*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        default:
            print("Input error.")
        }
    }
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand)\(model) trunk free: \(space)")
            } else { print("Input error or \(brand)\(model) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) engine is on")
            } else {print("\(brand)\(model) engine is off")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) windows are open")
            } else { print("\(brand)\(model) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) trunck is empty")
    }
}

struct someTruck {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        default:
            print("Input error.")
        }
    }
    let release : Int
    var bodyVolume : Double {
        willSet {
            if (trunkState == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print ("\(brand)\(model) trunk free: \(space)")
            } else { print("Input error or \(brand)\(model) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) engine is on")
            } else {print("\(brand)\(model) engine is off")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) windows are open")
            } else { print("\(brand)\(model) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand)\(model) trunck is empty")
    }
}

var car1 = someCar(brand: "BMW", model: "x6", color: "clear", release: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty)
var car2 = someCar(brand: "Lada", model: "Vesta", color: "clear", release: 2017, trunkVolume: 480.0, engineState: .stop, windowState: .close, trunkState: .full)

var truck1 = someTruck(brand: "Mercedes-Benz", model: "AXOR", color: "clear", release: 2012, bodyVolume: 100000.0, engineState: .start, windowState: .open, trunkState: .full)
var truck2 = someTruck(brand: "Mercedes-Benz", model: "Atego", color: "clear", release: 2013, bodyVolume: 150000.0, engineState: .start, windowState: .close, trunkState: .empty)


car1.engineState = .start
car1.trunkVolume = 340.0
car1.changeColor(c: "red")
car2.trunkVolume = 890.0
car2.emptyTrunck()
car2.trunkVolume = 80.9
car2.windowState = .open
car2.changeColor(c: "black")

truck1.engineState = .stop
truck1.windowState = .close
truck2.engineState = .stop
truck2.bodyVolume = 5678908


print ("Information about the first car: brand&model: \(car1.brand)\(car1.model), release: \(car1.release), color: \(String(describing: car1.color)), free trunkVolume: \(car1.trunkVolume), engine is \(car1.engineState)")

//similarly, you can output information about the other cars or trucks.

