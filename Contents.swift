
import Foundation
import UIKit
import Darwin.C.math
//1. Решить квадратное уравнение ax1^2+bx2+c=0

var a = 1.0
var b = -8.0
var c = 12.0
var x1 = 0.0
var x2 = 0.0

var D = pow(b, 2)-4*a*c //pow - возведение в квадрат

if a != 0
{
    if (D<0)
    {
        print("Корней нет")
    }

    if (D==0)
    {
        x1 = (-b+sqrt(D))/(2*a)
        print("x1:", x1)
        print("Дискриминант:", D)
    }

    if (D>0)
    {
    x1 = (-b+sqrt(D))/(2*a)
    x2 = (-b-sqrt(D))/(2*a)
        
        print("x1:", x1)
        print("x2:", x2)
        print("Дискриминант:", D)
    }
}

else
{
    //a=0, bx2+c=0,x2=-c/b - решаем линейное уравнение
    x2 = -c/b
    print("Вы решаете линейное уравнение, x2:", x2)
}

print("--------")

//-----------

//2. Даны катеты прямоугольного треугольника.
//Найти площадь, периметр и гипотенузу треугольника.

var a1 = 3.0
var b1 = 4.0
//var c1 = 0.0 - не объявляем, считается по формуле


var S = a1*b1/2 // считаем площадь
var c1 = sqrt(pow(a1, 2) + pow(b1, 2)) //считаем гипотенузу
var P = a1 + b1 + c1 // считаем периметр


if a1 != 0 && b1 != 0
{
    print("Площадь треугольника:", S)
    print("Гипотенуза:", c1)
    print("Периметр:", P)
}

else
{
    print("Некорректная постановка задачи")
}
print("--------")
//-----------

//3. *Пользователь вводит сумму вклада в банк и годовой процент.
//Найти сумму вклада через 5 лет.
//String(format: "%.2f", depositSum) - округлем до 2 знаков

var depositSum: Double = 45.0 // объявили сумму первоночального вклада
var countYears = 1
var percent: Double = 10.0 // объявили годовой процент

print("Введенная Вами сумма вклада:", depositSum, "рублей под", percent, "годовых")

if depositSum <= 0{
    print("Сумма вклада не может быть отрицательной")
}
else{
    while countYears <= 5
    {
        let onePercent = depositSum / 100.0 //вычисляем, чему равен один процент вклада
        let annualIncome = onePercent * percent
        depositSum = depositSum + annualIncome // здесь мы находим сумму вклада через год
        print("Сумма вклада за", countYears, "-й год ", String(format: "%.2f", depositSum))
        countYears += 1
    }
}
 */
//-----------

/*for _ in 0 ... 10 {
    a += 1
}



