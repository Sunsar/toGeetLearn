//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

 import Foundation

 enum Action {
     case startEngine
     case stopEngine
     case openWindows
     case closeWindows
     case putInTheTrunk(volume: Decimal)
     case unloadFromTheTrunk(volume: Decimal)
     case audioSis
     case wheelsAreIntact
 }


 protocol AllCar: class {
     var brandCar: String { get }
     var yearOfIssue: Int { get }
     var trunkVolume: Decimal { get }
     var engineStarted: Bool { get set }
     var windowsAreOpen: Bool { get set }
     var filledTrunkVolume: Decimal { get set }

     func engine() -> Void
     func window() -> Void
     func putInTheTrunk(volume: Decimal) -> Void
     func unloadFromTheTrunk(volume: Decimal) -> Void
 }

 extension AllCar {
     func engine() -> Void {
         if engineStarted == true {
             engineStarted = false
             print("Двигатель остановлен")
         } else {
             engineStarted = true
             print("Двигатель запущен")
         }
     }

     func window() -> Void {
         if windowsAreOpen == true {
             windowsAreOpen = false
             print("Окна закрыты")
         } else {
             windowsAreOpen = true
             print("Окна открыты")
         }
     }

     func putInTheTrunk(volume: Decimal) -> Void {
         if volume <= (trunkVolume - filledTrunkVolume) {
             filledTrunkVolume += volume
             print("В багажнк загружен объём \(volume). Общая загруженность: \(filledTrunkVolume) из \(trunkVolume)")
         } else {
             print("В багажник объём \(volume) не вместится. Доступный свободный объём: \(trunkVolume - filledTrunkVolume)")
         }
     }

     func unloadFromTheTrunk(volume: Decimal) -> Void {
         if volume > filledTrunkVolume {
             print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
         } else {
             filledTrunkVolume -= volume
             print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
         }
     }
 }

// Любой легковой автомобиль SportCar


 class SportCar: AllCar {
     var brandCar: String
     var yearOfIssue: Int
     var trunkVolume: Decimal
     var engineStarted: Bool
     var windowsAreOpen: Bool
     var filledTrunkVolume: Decimal
     let ifAudioSis: Bool
     var ifAudioSisOn: Bool

     //инициализация аудио системы
     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal, AudioSisOn: Bool) {
         self.ifAudioSis = true
         self.ifAudioSisOn = AudioSisOn
         self.brandCar = brandCar
         self.yearOfIssue = yearOfIssue
         self.trunkVolume = trunkVolume
         self.engineStarted = engineStarted
         self.windowsAreOpen = windowsAreOpen
         if filledTrunkVolume >= self.trunkVolume {
             self.filledTrunkVolume = trunkVolume
         } else {
             self.filledTrunkVolume = filledTrunkVolume
         }
     }

     func audSis() -> Void {
         if ifAudioSis == true {
             if ifAudioSisOn == true {
                ifAudioSisOn = false
                 print("Не звучит")
             } else {
                ifAudioSisOn = true
                 print("Звучит")
             }
         } else {
            print("Действие для автомобиля невозможно")
         }
     }

 }

 extension SportCar: CustomStringConvertible {
     var description: String {
         return """

             Марка авто: \(self.brandCar)
             Год выпуска: \(self.yearOfIssue)
             Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)
             Аудио система: \(self.ifAudioSisOn ? "Качает" : "Не работает")
             Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")
             Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")

             """
     }
 }

var delorean = SportCar.init(
    brandCar: "Delorean",
    yearOfIssue: 1981,
    trunkVolume: 132,
    engineStarted: true,
    windowsAreOpen: false,
    filledTrunkVolume: 10,
    AudioSisOn: true
)

 print(delorean)
 delorean.putInTheTrunk(volume: 100)
 delorean.putInTheTrunk(volume: 20)
 delorean.unloadFromTheTrunk(volume: 10)
 delorean.engine()
 delorean.window()
 print(delorean)

var chevroletImpala = SportCar.init(
    brandCar: "Chevrolet Impala",
    yearOfIssue: 1967,
    trunkVolume: 300,
    engineStarted: true,
    windowsAreOpen: true,
    filledTrunkVolume: 100,
    AudioSisOn: true
)

print(chevroletImpala)
chevroletImpala.putInTheTrunk(volume: 100)
chevroletImpala.putInTheTrunk(volume: 20)
chevroletImpala.unloadFromTheTrunk(volume: 10)
chevroletImpala.engine()
chevroletImpala.window()
chevroletImpala.ifAudioSis
print(chevroletImpala)




//Любой грузовик TrunkCar

class TrunkCar: AllCar{
     var brandCar: String
     var yearOfIssue: Int
     var trunkVolume: Decimal
     var engineStarted: Bool
     var windowsAreOpen: Bool
     var filledTrunkVolume: Decimal
     var wheelsIntact: Bool



     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal, wheelsIntact: Bool) {
         self.wheelsIntact = wheelsIntact
         self.brandCar = brandCar
         self.yearOfIssue = yearOfIssue
         self.trunkVolume = trunkVolume
         self.engineStarted = engineStarted
         self.windowsAreOpen = windowsAreOpen
         if filledTrunkVolume >= self.trunkVolume {
             self.filledTrunkVolume = trunkVolume
         } else {
             self.filledTrunkVolume = filledTrunkVolume
         }
     }

     func trunkBodyMove() -> Void {
        if wheelsIntact == false {
           wheelsIntact = true
            print("Не все колеса целы")
        } else {
           wheelsIntact = false
            print("Все колеса целы")
        }
     }

}

 extension TrunkCar: CustomStringConvertible {
     var description: String {
         return """

             Марка авто: \(self.brandCar)
             Год выпуска: \(self.yearOfIssue)
             Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)
             Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")
             Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")
             Колеса: \(self.wheelsIntact ? "Повреждены" : "Целы")

             """
     }
 }

var renaultMagnum = TrunkCar.init(
    brandCar: "Renault Magnum",
    yearOfIssue: 1997,
    trunkVolume: 130000,
    engineStarted: false,
    windowsAreOpen: true,
    filledTrunkVolume: 130000,
    wheelsIntact: false
)

print(renaultMagnum)
renaultMagnum.engine()
renaultMagnum.unloadFromTheTrunk(volume: 15000)
renaultMagnum.putInTheTrunk(volume: 17000)
renaultMagnum.putInTheTrunk(volume: 150000)
renaultMagnum.unloadFromTheTrunk(volume: 3500.5)
renaultMagnum.window()
renaultMagnum.trunkBodyMove()
print(renaultMagnum)
