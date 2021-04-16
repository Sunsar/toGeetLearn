//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 //
 //2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 //
 //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 //
 //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 //
 //5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 //
 //6. Вывести значения свойств экземпляров в консоль.
 import Foundation


 enum action {
     case startEngine
     case stopEngine
     case openWindows
     case closeWindows
     case putInTheTrunk(volume: Decimal)
     case unloadFromTheTrunk(volume: Decimal)
 }

// Любой легковой автомобиль SportCar
 struct sportCar {
     let brandCar: String
     let yearOfIssue: Int
     let trunkVolume: Decimal
     var engineStarted: Bool
     var windowsAreOpen: Bool
     var filledTrunkVolume: Decimal

     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal) {
         self.brandCar = brandCar
         self.yearOfIssue = yearOfIssue
         self.trunkVolume = trunkVolume
         self.engineStarted = engineStarted
         self.windowsAreOpen = windowsAreOpen
         self.filledTrunkVolume = filledTrunkVolume
     }

     mutating func doAction (action: action) {
         switch action {
         case .startEngine:
             engineStarted = true
             print("Запустить двигатель")
         case .stopEngine:
             engineStarted = false
             print("заглушить двигатель")
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
         }
     }

     func printInfo(){
         print("\n")
         print("Марка авто: \(self.brandCar)")
         print("Год выпуска: \(self.yearOfIssue)")
         print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
         print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
         print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
     }
 }

 var delorean = sportCar.init(
     brandCar: "Delorean",
     yearOfIssue: 1981,
     trunkVolume: 132,
     engineStarted: true,
     windowsAreOpen: false,
     filledTrunkVolume: 10
 )

delorean.printInfo()
delorean.doAction(action: .stopEngine)
delorean.doAction(action: .unloadFromTheTrunk(volume: 15))
delorean.doAction(action: .putInTheTrunk(volume: 40))
delorean.doAction(action: .putInTheTrunk(volume: 10))
delorean.doAction(action: .unloadFromTheTrunk(volume: 35.5))
delorean.doAction(action: .openWindows)
delorean.printInfo()

 //Любой грузовик TrunkCar.
 struct TrunkCar{
     let brandCar: String
     let yearOfIssue: Int
     let trunkVolume: Decimal
     var engineStarted: Bool
     var windowsAreOpen: Bool
     var filledTrunkVolume: Decimal

     init(brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal) {
         self.brandCar = brandCar
         self.yearOfIssue = yearOfIssue
         self.trunkVolume = trunkVolume
         self.engineStarted = engineStarted
         self.windowsAreOpen = windowsAreOpen
         self.filledTrunkVolume = filledTrunkVolume
     }

     mutating func doAction (action: action){
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
         case .unloadFromTheTrunk(volume: let volume):
             if volume > filledTrunkVolume {
                 print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
             } else {
                 filledTrunkVolume -= volume
                 print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
             }
         }
     }

     func printInfo() {
         print("\n")
         print("Марка авто: \(self.brandCar)")
         print("Год выпуска: \(self.yearOfIssue)")
         print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
         print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
         print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
     }
 }

 var renaultMagnum = TrunkCar.init(
     brandCar: "Renault Magnum",
     yearOfIssue: 1997,
     trunkVolume: 130000,
     engineStarted: false,
     windowsAreOpen: true,
     filledTrunkVolume: 130000
 )


renaultMagnum.printInfo()
renaultMagnum.doAction(action: .startEngine)
renaultMagnum.doAction(action: .unloadFromTheTrunk(volume: 15000))
renaultMagnum.doAction(action: .putInTheTrunk(volume: 170000))
renaultMagnum.doAction(action: .putInTheTrunk(volume: 150000))
renaultMagnum.doAction(action: .unloadFromTheTrunk(volume: 3500.5))
renaultMagnum.doAction(action: .closeWindows)
renaultMagnum.printInfo()
