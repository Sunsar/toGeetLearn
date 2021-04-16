 
 import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 //2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 //3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 //4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 //5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 //6. Вывести значения свойств экземпляров в консоль.

 enum Action{
     case startEngine
     case stopEngine
     case openWindows
     case closeWindows
     case putInTheTrunk(volume: Decimal)
     case unloadFromTheTrunk(volume: Decimal)
     case audioSis
     case wheelsAreIntact
 }

 class AllCar{
     let brandCar: String
     let yearOfIssue: Int
     let trunkVolume: Decimal
     var engineStarted: Bool
     var windowsAreOpen: Bool
     var filledTrunkVolume: Decimal

     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal){
         self.brandCar = brandCar
         self.yearOfIssue = yearOfIssue
         self.trunkVolume = trunkVolume
         self.engineStarted = engineStarted
         self.windowsAreOpen = windowsAreOpen
         if filledTrunkVolume >= self.trunkVolume {
             self.filledTrunkVolume = trunkVolume
         }else{
             self.filledTrunkVolume = filledTrunkVolume
         }
     }

     func doAction(action: Action){
         print("Этот метод ещё ничего делать не умеет")
     }
     func printInfo(){
         print("Этот метод ещё ничего делать не умеет")
     }
 }

 // Любой легковой автомобиль SportCar
 class SportCar: AllCar{
     let ifAudioSis: Bool
     var ifAudioSisOn: Bool

     //инициализация аудио системы
     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal, AudioSisOn : Bool) {
         self.ifAudioSis = true
         self.ifAudioSisOn = AudioSisOn
         super.init(brandCar: brandCar, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engineStarted: engineStarted, windowsAreOpen: windowsAreOpen, filledTrunkVolume: filledTrunkVolume)
     }
    
     override func doAction(action: Action) {
         switch action {
         case .startEngine:
             engineStarted = true
             print("Двигатель запущен")
         case .stopEngine:
             engineStarted = false
             print("Двигатель остановлен")
         case .openWindows:
             windowsAreOpen = true
             print("Окна открыты")
         case .closeWindows:
             windowsAreOpen = false
             print("Окна закрыты")
         case .putInTheTrunk(volume: let volume):
             if volume <= (trunkVolume - filledTrunkVolume) {
                 filledTrunkVolume += volume
                 print("В багажнк загружен объём \(volume). Общая загруженность: \(filledTrunkVolume) из \(trunkVolume)")
             } else {
                 print("В багажник объём \(volume) не вместится. Доступный свободный объём: \(trunkVolume - filledTrunkVolume)")
             }
         case.unloadFromTheTrunk(volume: let volume):
             if volume > filledTrunkVolume {
                 print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
             } else {
                 filledTrunkVolume -= volume
                 print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
             }
         case.audioSis:
             if ifAudioSis == false {
                 if ifAudioSisOn == false {
                    ifAudioSisOn = true
                     print("Отличный звук!")
                 } else {
                    ifAudioSisOn = false
                     print("Не качает!")
                 }
             }
         default:
             print("Действие для автомобиля невозможно")
         }
     }

     override func printInfo(){
        print("\n")
        print("Марка авто: \(self.brandCar)")
        print("Год выпуска: \(self.yearOfIssue)")
        print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
        print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
        print("Аудио система: \(self.ifAudioSisOn ? "Качает" : "Не работает") ")
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

delorean.printInfo()
delorean.doAction(action: .stopEngine)
delorean.doAction(action: .unloadFromTheTrunk(volume: 15))
delorean.doAction(action: .putInTheTrunk(volume: 40))
delorean.doAction(action: .putInTheTrunk(volume: 10))
delorean.doAction(action: .unloadFromTheTrunk(volume: 35.5))
delorean.doAction(action: .openWindows)
delorean.doAction(action: .audioSis)
delorean.printInfo()
 
 var chevroletImpala = SportCar.init(brandCar: "Chevrolet Impala", yearOfIssue: 1967, trunkVolume: 300, engineStarted: true, windowsAreOpen: true, filledTrunkVolume: 100, AudioSisOn: true)
 
 chevroletImpala.printInfo()
 chevroletImpala.doAction(action: .audioSis)
 chevroletImpala.doAction(action: .wheelsAreIntact)
 

 //Любой грузовик TrunkCar.
 class TrunkCar: AllCar{
     var wheelsIntact: Bool
    // истализация состаяния колес
     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal, wheelsIntact: Bool){
         self.wheelsIntact = wheelsIntact
         super.init(brandCar: brandCar, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engineStarted: engineStarted, windowsAreOpen: windowsAreOpen, filledTrunkVolume: filledTrunkVolume)
     }

     override func doAction(action: Action){
         switch action{
         case .startEngine:
             engineStarted = true
             print("Двигатель запущен")
         case .stopEngine:
             engineStarted = false
             print("Двигатель остановлен")
         case .openWindows:
             windowsAreOpen = true
             print("Окна открыты")
         case .closeWindows:
             windowsAreOpen = false
             print("Окна закрыты")
         case .putInTheTrunk(volume: let volume):
             if volume <= (trunkVolume - filledTrunkVolume) {
                 filledTrunkVolume += volume
                 print("В багажнк загружен объём \(volume). Общая загруженность: \(filledTrunkVolume) из \(trunkVolume)")
             } else {
                 print("В багажник объём \(volume) не вместится. Доступный свободный объём: \(trunkVolume - filledTrunkVolume)")
             }
         case .unloadFromTheTrunk(volume: let volume):
             if volume > filledTrunkVolume {
                 print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
             } else {
                 filledTrunkVolume -= volume
                 print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
             }
         case .wheelsAreIntact:
                 if wheelsIntact == false {
                    wheelsIntact = true
                     print("Не все колеса целы")
                 } else {
                    wheelsIntact = false
                     print("Все колеса целы")
                 }
         default:
             print("Что-то пошло не так")
         }
     }

    override func printInfo(){
        print("\n")
        print("Марка авто: \(self.brandCar)")
        print("Год выпуска: \(self.yearOfIssue)")
        print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
        print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
        print("Колеса: \(self.wheelsIntact ? "Повреждены" : "Целы")")
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

 renaultMagnum.printInfo()
 renaultMagnum.doAction(action: .startEngine)
 renaultMagnum.doAction(action: .unloadFromTheTrunk(volume: 15000))
 renaultMagnum.doAction(action: .putInTheTrunk(volume: 17000))
 renaultMagnum.doAction(action: .putInTheTrunk(volume: 150000))
 renaultMagnum.doAction(action: .unloadFromTheTrunk(volume: 3500.5))
 renaultMagnum.doAction(action: .closeWindows)
 renaultMagnum.doAction(action: .wheelsAreIntact)

