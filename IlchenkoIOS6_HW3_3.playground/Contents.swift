import UIKit
//: Домашнее задание необходимо выполнить в данном файле, перед отправкой переименуйте название файла (латиницей) в формате ФамилияГруппаDZ4_3, например, *IvanovIOS4_DZ4_3*, заархивировать и приложить в личном кабинете для проверки.
/*:
 Чтобы успешно выполнить это домашнее задание, необходимо усвоить следующие темы:
 * [Коллекции eng.](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
 * [Коллекции  рус.](https://swiftbook.ru/content/languageguide/collection-types/)
 * [Управление потоком eng.](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
 * [Управление потоком рус.](https://swiftbook.ru/content/languageguide/control-flow/)
 * [Функции eng.](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
 * [Функции рус.](https://swiftbook.ru/content/languageguide/functions/)
*/
//: ## Задача №1
//: В данной задаче Вы тренируетесь Добавлять и Удалять значения в **`Хранилище (массив)`** при помощи двух функций, которые Вам и нужно реализовать. Функции принимают значение, но ничего не возвращают.
//: Первая функция добавляет элемент в массив, вторая функция удаляет элемент из массива, вы сами можете выбрать любой удобный для вас вариант добавления и удаления элементов из массива.
//: ### Алгоритм решения:
//:  * Создайте пустой массив строк типа String на любимую тематику, например, это будет Хранилище столовых приборов (этот пример не использовать), в который вы будете поочередно добавлять или удалять ложки, вилки и т.п. приборы.
//: * Создайте 2 функции в соответствии с условием.
//: * Попробуйте добавлять и удалять значения в массиве при помощи созданных функций.
//: * Что произойдет, если попытаетесь удалить значение, которого нет в Хранилище? Напишите, что в этом случае вы можете изменить в своей функции и внесите в нее изменения.
//: * *(условие со звездочкой - не обязательное) обе функции должны принимать массив и значение. Они должны добавлять или удалять значения в массиве. Функция удаления должна быть безопасной, т.е. если Хранилище пустое, мы должны сообщить об этом пользователю, если запрашиваемое на удаление значение отсутствует, необходимо также сообщить, что такого элемента нет. Запрещается использование forced unwrapping, если в вашем варианте будет необходимость работать с опционалами.*
// Решение задачи №1:
var array = [Int]()
var range = Int.random(in: 5...10)

for _ in 0...range - 1 {
    array.append(Int.random(in: 0...100))
}
print("Task #1\nYou have array of \(range) elements\n\t\(array)")

func increaseArray (howMuchNeedAdd nubmer: Int) {
    for _ in 0...nubmer - 1 {
        array.append(Int.random(in: 0...100))
    }
    range += nubmer
}

increaseArray(howMuchNeedAdd: Int.random(in: 2...10)) //Увеличить массив на random элементов
print("After increase array and you have array of \(range) elements\n\t\(array)")

func decraseArray (howMuchNeedDelete number: Int) {
    for _ in 0...number-1 {
        if array.isEmpty {
            return
        } else {
            array.removeLast()
        }
    }
    range -= number
}

decraseArray(howMuchNeedDelete: Int.random(in: 2...10)) //Уменьшить массив на random элементов

if array.isEmpty {
    print("You delete more than needed elements. Your array is empty")
} else {
    print("After decrase array and you have array of \(range) elements\n\t\(array)\n")
}

//сначала прочитал задачу и начал выполнять и только потом увидел описанный алгоритм. Нужно ли сделать еще один экземпляр по алгоритму?
//: ## Задача №2
//: Вы получили тестовое задание от службы доставки еды: преобразовать бонусные баллы клиентов, которые хранятся на сайте, в денежные единицы. Со стороны сайта приходит словарь, содержащий ID клиента **(Int)** и накопленную сумму Бонусов **(Double)**. Ваша задача вернуть на сайт словарь, содержащий ID клиента **(Int)** и конвертированные денежные единицы **(Int)**, каждые 100 бонусов равны 10 денежным единицам.
//: ### Алгоритм решения:
//: * Словарь со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в `userPoints`.
//: * Распечатайте словарь и посмотрите, с какими значениями вы будете работать.
//: * Создайте функцию, которая принимаем словарь, ключом которого будет тип Integer, значением число с плавающей точкой Double, вернуть необходимо словарь ключом и значением, которого будет Integer.
//: * Вызовите функцию и распечатайте полученный результат.
//: * Дополнительно(не обязательно) входящих параметров может быть больше, например, для коэффициента пересчета баллов в денежные единицы.
// Решение задачи №2:
// подготовленный словарь

userPoints
print("Task #2\n\(userPoints)\n")

func translatePoint(points:Dictionary<Int,Double>, caef: Double) -> Dictionary<Int,Int> {
    
    var newUserPoints = Dictionary<Int,Int>()
    
    for (key, value) in points {
        newUserPoints.updateValue(Int(value/10 * caef), forKey: key)
    }
    return newUserPoints
}

print(translatePoint(points: userPoints, caef: 0.95))

//: ## Задача №3 (*)
//:  Вам необходимо реализовать функцию, которая принимаем массив опциональных значений типа Integer и возвращает кортеж, в который необходимо передать сумму четных и нечетных значений.
//: - Массив может содержать повторяющиеся и nil значения, например: `[1, 2, nil, 12, 1, nil, 3, 2]`.
//: - В вычислении должны быть использованы только уникальные значения, а повторяющиеся учитываться не должны. Например, у нас повторяются числа 1 и 2, но попадать в результат они должны один раз; сумма нечетных будет `(1 + 3 = 4)`, четных `(2 + 12 = 14)`.
//:  - Так как в массиве могут быть nil, а вернуть необходимо неопциональное значение, необходимо использовать безопасное развертывание опционала (optional binding).
//:  - Для проверки вашего решения передайте в функцию подготовленный массив `arrayOfNumbers`.
//:  - Массив со своими значениями создавать не нужно. Значения, с которыми вы будете работать, инкапсулированы и переданы в `arrayOfNumbers`.
//:  - Распечатайте массив и посмотрите, с какими значениями вы будете работать.
//:  - Если вы все правильно сделаете, то получите ответ: `сумма четных: 1378, нечетных: 1304`.
// Решение задачи №3(*)
// подготовленный массив
arrayOfNumbers
//print(arrayOfNumbers)

//1 version

func calculateSumEvenOddValues(from array: [Int?]) -> (Int, Int) {
  
    var newArray = [Int]()
    for element in array {
        if let check = element { //check element on nil value
            newArray.append(check)
        }
    }
    newArray = Array(Set(newArray)) //check for duplication elements of array
    //print(newArray)
    
    var sumEven = 0
    var sumNoEven = 0
    
    for element in newArray {
        if element % 2 == 0 {
            sumEven += element
        } else {
            sumNoEven += element
        }
    }
  return (sumEven,sumNoEven)
}

//2 version
func calc(from array: [Int?]) -> (Int, Int) {
    
    var a = 0
    var b = 0
    
    var newArray = [Int]()
    for element in array {
        if let check = element { //check element on nil value
            if !newArray.contains(check)  {
                newArray.append(check)
                if check % 2 == 0 {
                    a += check
                } else {
                    b += check
                }
            }
        }
    }
    
    return (a,b)
}

// проверка решения Задача №3
calculateSumEvenOddValues(from: arrayOfNumbers)
calc(from: arrayOfNumbers)

