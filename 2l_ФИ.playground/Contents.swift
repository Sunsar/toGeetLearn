import Foundation
//1. Написать функцию, которая определяет, четное число или нет.
//Функция должна принимать значение, которое необходимо проверить на чётность и вернуть результат в виде да/нет (у нас для этого есть специальный тип данных)
var anyNubber = 4

func whatNuber() {
    if anyNubber % 2 == 0 {
       print("\(anyNubber) четное")
    } else {
       print("\(anyNubber) не четное")
    }
}
whatNuber()
// !! не понял про специальный тип данных

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
//Аналогичная функция, но условие проверки в ней будет отличаться.
var anyNubberDivisibleThree = 3

func whatNuberThree() {
    if anyNubberDivisibleThree % 3 == 0 {
       print("\(anyNubberDivisibleThree) да ")
    } else {
       print("\(anyNubberDivisibleThree) нет ")
    }
}

whatNuberThree()

//3. Создать возрастающий массив из 100 чисел.
//Любым удобным для вас способом задайте массив и сохраните в переменную или константу.
var anyArray = [Int]()
var anyInput = 0

while anyInput < 100 {
    anyArray.append(anyInput + 1 )
    anyInput += 1
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//Подумайте, как это можно сделать, учитывая те конструкции, которые мы рассмотрели на уроке. Существует большое количество способов решить данное задание.
for i in anyArray where (i % 2 == 0) || (i % 3 == 0) {
    anyArray.remove(at : (anyArray.firstIndex(of: i)!))
 }

