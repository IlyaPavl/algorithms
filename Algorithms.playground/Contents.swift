print("Курс Swiftbook по алгоритмам и структурам\n")
/*
 Общий алгоритм решения задач:
 • Внимательно читаем/слушаем условие задачи
 • Пытаемся придумать уточняющие вопросы
 • Рисуем примеры, лучше парочку
 • Придумываем решение «в лоб» и оцениваем сложность
 • Придумываем более оптимальное решение
 • Тестируем код по тетрадке на новом примере
 • Переписываем код в IDE
 */

print("\nУрок 3 - алгоритм по поиску и выводу индексов чисел, которые в сумме дают целевое значение\n")

class LessonThree {
    func twoSum(array: [Int], target: Int) -> [Int] {
        
/*
1. Метод twoSum принимает два параметра: array (массив целых чисел) и target (желаемая сумма).
2. Создается пустой словарь dictionary, который будет использоваться для хранения значений из массива в качестве ключей и соответствующих им индексов в качестве значений.
3. Также создается пустой массив resultArray, который будет хранить индексы двух чисел, сумма которых равна целевому значению.
4. Затем метод перебирает элементы массива с помощью метода enumerated(), который возвращает пару значений (индекс, значение) для каждого элемента.
5. Внутри цикла проверяется, существует ли в словаре значение target - j, где j - текущий элемент массива. Если такое значение есть, значит уже было найдено число, которое суммируется с текущим элементом и даёт целевую сумму.
6. Если такое значение существует, то добавляем индекс этого значения и текущий индекс в resultArray и возвращаем его.
7. Если такого значения нет в словаре, то добавляем текущий элемент массива в словарь с ключом j и соответствующим индексом i.
8. В конце метода, если не была найдена пара чисел, сумма которых равна целевому значению, возвращается пустой resultArray.
*/
        
        var dictionary: [Int : Int] = [:]
        var resultArray : [Int] = []
        
        for (i, j) in array.enumerated () {
            if let index = dictionary[target - j] {
                resultArray.append(index)
                resultArray.append(i)
                return resultArray
            }
            dictionary[j] = i
        }
        return resultArray
    }
}

let exampleThree = LessonThree()
print(exampleThree.twoSum (array: [4,6,8,3,5,24,3,12], target: 17))

print("\nУрок 4 - алгоритм по удалению дубликатов из массива\n")

class LessonFour {
    func removeDuplicates(input: inout [Int]) -> Int {
/*
1. Создаем переменную `last` типа `Int?`, которая будет хранить последний элемент, встреченный в цикле. Изначально ее значение равно `nil`.
2. Создаем переменную `index` типа `Int` и устанавливаем ее значение равным 0. Эта переменная будет использоваться для выбора текущего элемента массива.
3. Начинаем цикл `while`, который продолжается, пока `index` меньше количества элементов в массиве `input`.
4. Внутри цикла проверяем условие: если текущий элемент `input[index]` равен `last`, то это означает, что элемент повторяется.
   - В этом случае мы удаляем текущий элемент из массива с помощью метода `remove(at:)` и не увеличиваем `index`, чтобы остаться на том же индексе для следующей итерации.
5. Если условие не выполняется, значит текущий элемент `input[index]` отличается от `last`.
   - Мы обновляем значение `last` для хранения текущего элемента `input[index]`.
   - Увеличиваем значение `index` на 1 для перехода к следующему элементу в следующей итерации.
6. По окончании цикла возвращаем количество элементов в массиве `input` с помощью `input.count`.
*/
        var last: Int?                      // хранит последний элемент в цикле
        var index: Int = 0                  // индекс выбранного элементы
        
        while index < input.count {         // итерируем переменную индекс, пока она не совпадет с количество элементов массива
            if input[index] == last {       // условие: если элемент по индекс равен предыдущему значению...
                input.remove(at: index)     // ...значит удаляем этот элемент
            } else {
                last = input[index]         // в любом другом случае присваиваем предыдущему элементу текущее значение массива
                index += 1                  // прибавляем единицу значению index
            }
        }
        
        return input.count
    }
}

let exampleFour = LessonFour()
var arrayFour = [0, 0, 1, 1, 3, 4, 4, 4, 5, 5, 8]
print(exampleFour.removeDuplicates(input: &arrayFour))

print("\nУрок 5 - алгоритм по поиску кратчайшего несортированного, непрерывного подмассива в массиве, т.е найти все эелементы которые надо отсортировать, чтобы получить сортированный массив\n")

class LessonFive {
    func findUnsortedSubarray(array: [Int]) -> Int {
        
        /*
         1. Инициализируем переменные:
             • maxNum - для хранения максимального значения в подмассиве (устанавливаем начальное значение как первый элемент массива).
             • end - для фиксации индекса последнего значения границы.
             • n - количество элементов в массиве (запоминаем для удобства).
             • minNum - для хранения минимального значения в подмассиве (устанавливаем начальное значение как последний элемент массива).
             • start - для фиксации индекса начальной границы.
         2. Первый цикл for:
             • Проходим по каждому элементу массива array с помощью enumerated(), получая индекс index и текущий элемент currentItem.
             • Обновляем maxNum с помощью max(maxNum, currentItem), чтобы найти максимальное значение в подмассиве.
             • Если currentItem меньше maxNum, то это означает, что currentItem находится в неправильном порядке. Таким образом, обновляем end с текущим индексом index.
         3. Второй цикл for:
             • Проходим по каждому элементу массива array с помощью enumerated().
             • Обновляем minNum с помощью min(minNum, array[n - 1 - index]), чтобы найти минимальное значение в подмассиве.
             • Если array[n - 1 - index] больше minNum, то это означает, что array[n - 1 - index] находится в неправильном порядке. Таким образом, обновляем start с текущим индексом n - 1 - index.
         4. Возвращаем длину неправильно упорядоченного подмассива, которая вычисляется как end - start + 1. Это дает количество элементов, которые не находятся в правильном порядке в заданном массиве.
         */
        
        var maxNum = array[0]                                                   // создаем переменную, которую будем использовать для поиска максимального элемента подмассива, задаем ей значение 1 элемента массива
        var end = 0                                                             // для фиксации индекса последнего значения границы
        let n = array.count                                                     // для удобства поместим количество элементов массива в константу
        var minNum = array[n - 1]                                               // создаем переменную, которую будет использовать для поиска минимального элемента подмассива, задаем ей значение равное количество элементов массива
        var start = 1                                                           // для фиксации индекса начальной границы
        
        for (index, currentItem) in array.enumerated() {
            maxNum = max(maxNum, currentItem)                                   // для поиска правой границы подмассива для каждой итерации проверяем какой элемент больше: текущий или предудщий максимальный
            if currentItem < maxNum {                                           // если текущий эелемент больше, чем максимальный, то переменной end присваиваем индекс текущего эелемент
                end = index
            }
        }
        
        for (index, _) in array.enumerated() {                                  // делаем аналогично предыдущему циклу, только для поиска минимальной границы
            minNum = min(minNum, array[n - 1 - index])
            if array[n - 1 - index] > minNum {
                start = n - 1 - index
            }
        }
        return end - start + 1
    }
}

let exampleFive = LessonFive()
var arrayFive = [1, 4, 2, 3, 2, 6]
print(exampleFive.findUnsortedSubarray(array: arrayFive))

print("\nУрок 6 - алгоритм написания функции, которая переворачивает массив символов\n")

func reverseString(string: inout [Character]) {
/*
1. Создаем переменную first типа Int и устанавливаем ее значение равным 0. Эта переменная будет использоваться для указания индекса первого символа в строке.
2. Создаем переменную last типа Int и устанавливаем ее значение равным количеству символов в строке string минус 1. Эта переменная будет использоваться для указания индекса последнего символа в строке.
3. Начинаем цикл while, который будет выполняться, пока значение first меньше значения last. Это гарантирует, что мы будем менять местами символы только до середины строки.
   Внутри цикла:
   • Создаем временную переменную temp и присваиваем ей значение символа, находящегося по индексу first.
   • Затем заменяем символ, находящийся по индексу first, символом, находящимся по индексу last.
   • Заменяем символ, находящийся по индексу last, символом, который ранее был сохранен во временной переменной temp.
   • Увеличиваем значение first на 1, чтобы перейти к следующему символу в следующей итерации.
   • Уменьшаем значение last на 1, чтобы перейти к предыдущему символу в следующей итерации.
4. Когда условие цикла while не выполняется, значит мы обменяли все символы в строке и достигли середины.
5. Функция завершается, изменяя строку string, переданную по ссылке в качестве параметра.
*/
    var first = 0
    var last = string.count - 1
    while first < last {
        let temp = string[first]
        string[first] = string[last]
        string[last] = temp

        first += 1
        last -= 1
    }
}

var exampleSix: [Character] = ["g", "o", "a", "t"]
print(reverseString(string: &exampleSix))
print(exampleSix)

print("\nУрок 8 - алгоритм написания функции, которая возвращает true, если в двух строках не более одного отличия\n")

class LessonEight {
    
    /*
     1. Метод isOneDiff(firstString: String, secondString: String) -> Bool используется, когда количество символов в двух строках одинаковое. Он проверяет, отличаются ли строки максимум на один символ.
     •    Создается переменная countDifferent, которая будет использоваться для подсчета различающихся символов.
     •    В цикле for проходим по индексам символов обеих строк.
     •    С помощью методов index(_:offsetBy:) извлекаем текущие символы из каждой строки по соответствующему индексу.
     •    Сравниваем символы двух строк. Если они не равны, увеличиваем countDifferent на 1.
     •    Если countDifferent превышает 1, возвращаем false, так как строки отличаются более, чем на один символ.
     •    По окончании цикла, если countDifferent не превысило 1, возвращаем true, так как строки отличаются не более, чем на один символ.
     */
    
    func isOneDiff(firstString: String, secondString: String) -> Bool {
        var countDifferent = 0
        for i in 0..<firstString.count {
            let indexFirst = firstString.index(firstString.startIndex, offsetBy: i)                 // данная строка необходима, чтобы вытащить текущий символ по индексу из строки 1
            let indexSecond = secondString.index(secondString.startIndex, offsetBy: i)              // данная строка необходима, чтобы вытащить текущий символ по индексу из строки 2
            
            if firstString[indexFirst] != secondString[indexSecond] {                               // сравниваем символы
                countDifferent += 1
            }
            if countDifferent > 1 {
                return false
            }
        }
        return true
    }
    
    /*
     2.    Метод isOneAwayDiffLength(firstString: String, secondString: String) -> Bool используется, когда количество символов в двух строках разное. Он проверяет, являются ли строки на расстоянии одной модификации друг от друга при условии, что вторая строка короче.
     •    Создается переменная countDifferent, которая будет использоваться для подсчета различающихся символов.
     •    Создается переменная i, которая будет использоваться в качестве индекса для строки secondString.
     •    В цикле while итерируем переменную i до тех пор, пока не пройдем все символы в строке secondString.
     •    С помощью методов index(_:offsetBy:) извлекаем текущие символы из каждой строки по соответствующему индексу, учитывая сдвиг countDifferent для строки firstString.
     •    Сравниваем символы двух строк. Если они равны, увеличиваем i на 1, чтобы перейти к следующему символу в secondString.
     •    Если символы не равны, увеличиваем countDifferent на 1.
     •    Если countDifferent превышает 1, возвращаем false, так как строки отличаются более, чем на один символ.
     •    По окончании цикла, если countDifferent не превысило 1, возвращаем true, так как строки отличаются не более, чем на один символ.
     */

    func isOneAwayDiffLength(firstString: String, secondString: String) -> Bool {
        var countDifferent = 0
        var i = 0
        while i < secondString.count {                                                                      // цикл, который работает, пока не кончатся элементы во второй строке (т.к мы предполагаем, что она короче)
            let indexFirst = firstString.index(firstString.startIndex, offsetBy: i + countDifferent)        // i + countDifferent - так мы добиваемся, что счетчик увеличился только в первой строке
            let indexSecond = secondString.index(secondString.startIndex, offsetBy: i)
            
            if firstString[indexFirst] == secondString[indexSecond] {                                       // сравниваем символы, и если они равны, то увеличиваем индекс
                i += 1
            } else {                                                                                        // если не равны, то увеличиваем счетчик на 1
                countDifferent += 1
                if countDifferent > 1 {                                                                     // если счетчик стал больше 1, то возвращаем false
                    return false
                }
            }
        }
        return true
    }
    
    // собираем все функции в одну и прописываем условия их выполнения
    func isOneAway(firstString: String, secondString: String) -> Bool {
        if firstString.count - secondString.count >= 2 || secondString.count - firstString.count >= 2 {
            return false
        }
        else if firstString.count == secondString.count {
            return isOneDiff(firstString: firstString, secondString: secondString)
        }
        else if firstString.count > secondString.count {
            return isOneAwayDiffLength(firstString: firstString, secondString: secondString)
        }
        else {
            return isOneAwayDiffLength(firstString: secondString, secondString: firstString)
        }
    }
    
}

let testEight = LessonEight()

let test8 = testEight.isOneAway(firstString: "hello", secondString: "helo")
print(test8)

// MARK: - Структуры данных
print("\n\nСтруктуры данных")
/*
 Linked List - это связанные списки. По ним проще итерирвоваться, так как облегчает поиск элементов, поскольку N1 знает о N2, не знает об N3...Ni. За счет этого не нужно переберить все элементы списка
 По умолчанию не реализовать в Xcode, поэтому создаем его самостоятельно
 */

class ListNode {
    var value: Int
    var next: ListNode?
    var previous: ListNode?
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

func printList(head: ListNode?) {
    var currentNode = head
    
    while currentNode != nil {
        print(currentNode?.value ?? 0)
        currentNode = currentNode?.next
    }
}
let thirdNode = ListNode(value: 4, next: nil)
let secondNode = ListNode(value: 2, next: thirdNode)
let oneNode = ListNode(value: 3, next: secondNode)

printList(head: oneNode)

print("\nУрок 9 - алгоритм по перевороту связанного списка\n")

func reverseList(head: ListNode?) -> ListNode? {
    
    /*
     Данная функция `reverseList` используется для разворота односвязного списка. Она принимает голову списка `head` в качестве параметра и возвращает новую голову списка после разворота.
     1. Создаем переменную `currentNode` и инициализируем ее значением головы списка `head`. Она будет использоваться для итерации по списку.
     2. Создаем переменные `prev` и `next` типа `ListNode?` и присваиваем им значения `nil`. `prev` будет использоваться для хранения предыдущего узла, а `next` - для сохранения ссылки на следующий узел перед изменением связей.
     3. Запускаем цикл `while`, который выполняется, пока `currentNode` не станет равным `nil`, то есть пока не пройдем все узлы списка.
     4. Внутри цикла сохраняем ссылку на следующий узел в переменной `next`, чтобы не потерять доступ к нему после изменения связей.
     5. Затем меняем ссылку текущего узла `currentNode?.next` на предыдущий узел `prev`, чтобы развернуть связь в обратном направлении.
     6. Обновляем переменную `prev`, присваивая ей значение текущего узла `currentNode`, так как он станет предыдущим узлом для следующей итерации.
     7. Переходим к следующему узлу, присваивая `currentNode` значению `next`.
     8. По окончании цикла все узлы будут развернуты в обратном порядке.
     9. Возвращаем новую голову списка, которая теперь является последним узлом исходного списка, то есть значение `prev`.
     */
    var currentNode = head
    var prev: ListNode?
    var next: ListNode?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        prev = currentNode
        currentNode = next
    }
    return prev
}

let lesson9: () = printList(head: reverseList(head: oneNode))

print("\nУрок 10 - алгоритм по объединению по значениям двух отсортированных Linked List\n")

func mergeToLists(firstList: ListNode?, secondList: ListNode?) -> ListNode? {
    /*
    Данная функция `mergeToLists` используется для слияния двух отсортированных связанных списков. Она принимает две головы связанных списков `firstList` и `secondList` в качестве параметров и возвращает новую голову связанного списка после слияния.
    1. Проверяем, если `firstList` равен `nil`, то возвращаем `secondList`, так как первый список пустой.
    2. Проверяем, если `secondList` равен `nil`, то возвращаем `firstList`, так как второй список пустой.
    3. Создаем пустой список `emptyList`, инициализируя его с помощью `ListNode` с значением 0 и ссылкой на `nil`. Это служит начальным элементом для нового списка, который будет содержать отсортированные значения.
    4. Создаем две переменные `l1` и `l2`, которые инициализируются значениями `firstList` и `secondList` соответственно. Они будут использоваться для итерации по спискам.
    5. Создаем переменную `endOfSortedList` и присваиваем ей значение `emptyList`. Она представляет конец отсортированного списка, к которому будем добавлять значения из двух списков.
    6. Запускаем цикл `while`, который выполняется, пока итераторы `l1` и `l2` не достигнут конца своих списков (то есть пока оба списка не пройдены полностью).
    7. Внутри цикла проверяем условие: если значение текущего элемента `l1` меньше или равно значению текущего элемента `l2`, то добавляем `l1` в конец отсортированного списка `endOfSortedList` и переходим к следующему элементу `l1`.
    8. Если условие не выполняется, значит значение текущего элемента `l2` меньше значения текущего элемента `l1`. В этом случае добавляем `l2` в конец отсортированного списка `endOfSortedList` и переходим к следующему элементу `l2`.
    9. После добавления элемента в отсортированный список, обновляем указатель `endOfSortedList`, чтобы он указывал на новый конец списка.
    10. По окончании цикла проверяем, если один из списков `l1` или `l2` достиг конца (становится равным `nil`), то добавляем оставшийся список в конец отсортированного списка.
    11. Возвращаем новую голову отсортированного списка, которая находится в `emptyList.next`.
    */
    guard firstList != nil else { return secondList}
    guard secondList != nil else {return firstList}
    
    let emptyList: ListNode = ListNode(value: 0, next: nil)                 // создаем пустой список, т.е инициализируем список, чтобы в нем был начальный элемент
    var l1 = firstList, l2 = secondList                                     // создаем две переменные, которые будут указателями на элементы, по которым будем итерироваться для каждого входящего связанного списка
    var endOfSortedList: ListNode? = emptyList                              // создаем связанный список, которые будем возвращать и в который будем записывать значения из двух списков
    
    while l1 != nil && l2 != nil {
        if l1!.value <= l2!.value {
            endOfSortedList!.next = l1
            l1 = l1!.next
        } else {
            endOfSortedList!.next = l2
            l2 = l2!.next
        }
        endOfSortedList = endOfSortedList?.next
    }
    endOfSortedList?.next = l1 == nil ? l2 : l1
    
    return emptyList.next
}
print("\nУрок 11 - продолжаем работу со связанными списками\n")

let forthNode = ListNode (value: 12, next: nil)
let threeNode = ListNode (value: 9, next: forthNode)
let twoNode = ListNode (value: 6, next: threeNode)
let head = ListNode (value: 1, next: twoNode)

class NewListNode<T> {
    var value: T
    var next: NewListNode?
    var previous: NewListNode?
    
    init(value: T) {
        self.value = value
    }
}

struct NewLinkedList<T>: CustomStringConvertible {
    
    private var head: NewListNode<T>?
    private var tail: NewListNode<T>?
    
    var isEmpty: Bool {                             // для проверки: пусть ли связанный список
        return head == nil
    }
    
    var count: Int {
        var currentNode = head
        var count = 0
        while currentNode != nil {
            count += 1
            currentNode = currentNode?.next
        }
        return count
    }
    
    var first: NewListNode<T>? {                       // для вывода первого элемента списка
        return head
    }
    
    var last: NewListNode<T>? {                        // для вывода последнего элемента списка
        return tail
    }
    
    mutating func append(value: T) {                // функция для добавления элементов в связанный список
        let newNode = NewListNode(value: value)     // так как на вход принимаем Generic, то нам надо его сделать соответствующего типа
        if tail != nil {                            // если в связанном списке есть элементы, то берем новую ноду и указываем, что её предыдущий узел будет указывать на последний элемент (хвост)
            newNode.previous = tail                 // предыдущим значением для новой ноды будет хвост
            tail?.next = newNode                    // для бывшего хвоста следующим значением будет новая нода
        } else {
            head = newNode                          // если в голове связанного списка нет объектов, то newNode и будем началом списка
        }
        tail = newNode                              // фиксируем, что конечное значение доабвленной ноды станет хвостом
    }
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil { text += ", "}
        }
        return text + "]"
    }
    
    mutating func remove(node: NewListNode<T>) -> T {
        let prev = node.previous                        // предыдущий элемент от удаляемого
        let next = node.next                            // следующий элемент от удаляемого
        
        // если у предыдущей ноды есть элемент...
        if let prev = prev {
            prev.next = next                            // ..то у предыдущего значения следующим будем значение, которое идет после удаляемого
        } else {
            head = next
        }
        next?.previous = prev                           // предыдущим значением для следующего становится новое предыдущее
        
        if next == nil {                                // если следующая нода от той, которую мы хотим удалить равна nil...
            tail = prev                                 // то назначаем хвостой ноде предыдущее от удаляемого
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

func NewprintList(head: NewListNode<Int>?) {
    var currentNode = head
    
    while currentNode != nil {
        print(currentNode?.value ?? 0)
        currentNode = currentNode?.next
    }
}

var list = NewLinkedList<Int>()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.append(value: 4)
list.append(value: 5)
list.remove(node: list.first!)
print(list.description)

var list2 = NewLinkedList<String>()
list2.append(value: "abc")
list2.append(value: "cdf")
list2.isEmpty
list2.first?.value
list2.description
list2.remove(node: list2.last!)


print("\n\nДвумерные массивы")
print("\nУрок 12 - алгоритм написания функции, которая назначает клетки поля цифрами в \"Сапере\"\n")
/*
 1. Сначала создаем поле и заполняем его нулями
 2. С помощью цикла пробегаем по всем бомбам и заполнять поле значениями бомб (которые мы определим), а также изменить поля, окружающие бомбы
 3. Надо учесть, что в крайних углах массива рядом с бомбами значений нет
 4. Надо учесть, что если в окружении поля есть бомбы, то их значения должны увеличивать на единицу также
 5. А сами бомбы не должны менять значения
 6. Далее с помощью цикла пробегаемся по первой координате и заполняем поля с бомбой и её окружением
 7. Аналогично с другими бомбами
 */
func saper(bombs: [[Int]], rows: Int, columns: Int) -> [[Int]] {
    /*
    Данная функция `saper` используется для создания игрового поля для игры в сапер (Minesweeper) на основе переданных координат бомб. Она принимает двумерный массив `bombs`, количество `rows` строк и количество `columns` столбцов в качестве параметров и возвращает двумерный массив `field`, представляющий собой игровое поле с числами, указывающими количество бомб вокруг каждой клетки.

    1. Создаем двумерный массив `field` размером `rows` x `columns`, заполненный нулями. Это представляет собой игровое поле, на котором будут расположены бомбы и числа, указывающие количество бомб вокруг каждой клетки.
    2. Запускаем цикл `for-in`, который проходит по каждому элементу `bomb` в массиве `bombs`.
    3. На каждой итерации извлекаем координаты бомбы из массива `bomb` и сохраняем их в переменные `row` и `column` соответственно.
    4. Присваиваем клетке в поле с координатами `row` и `column` значение -1, чтобы указать, что там находится бомба.
    5. Запускаем вложенный цикл `for-in`, который проходит по соседним клеткам вокруг бомбы.
    6. На каждой итерации вложенного цикла проверяем условие: если координаты `(i, j)` являются допустимыми (не выходят за пределы поля) и значение клетки в поле с координатами `(i, j)` не равно -1 (то есть там нет бомбы), то увеличиваем значение клетки на 1, чтобы указать, что рядом находится еще одна бомба.
    7. По окончании всех итераций внешнего цикла возвращаем сформированное игровое поле `field`.
*/
    var field = Array(repeating: Array(repeating: 0, count: columns), count: rows)              // создаем поле
    
    // циклом проходим по значениям бомб, которые передаются пользователем
    for bomb in bombs {
        // на каждой итерации создаем два свойства, которые будут фиксировать позицию, на которой находится бомба
        let row = bomb[0]
        let column = bomb[1]
        
        // назначаем координате, где бомба значение -1
        field[row][column] = -1
        
        // соседним клеткам указываем, что рядом находится бомба через двойной цикл
        for i in row - 1...row + 1 {
            for j in column - 1...column + 1 {
                // по условиям присваиваем значения соседним клеткам (первые 4 проверки - это то, что мы не выходим за пределы массива)
                if (0 <= i) && (i < rows) && (0 <= j) && (j < columns) && (field[i][j] != -1) {
                    field[i][j] += 1
                }
            }
        }
    }
    return field
}

let field = saper(bombs: [[0,2], [0,3]], rows: 3, columns: 4)

field.map { (array) in print(array)}

print("\nУрок 13 - Очередь (подготовительный урок)\n")

// CustomStringConvertible - подписываем под протокол, чтобы выводило элементы в очереди
struct Queue<T>: CustomStringConvertible {
    // cоздаем в структуре приватное свойство лист, которое будет связанным листом
    private var list = NewLinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    // создаем функцию, которое будет добавлять в очередь элемент типа Т
    mutating func enqueue(element: T) {
        // здесь используем заготовку append из структуры NewLinkedList
        list.append(value: element)
    }
    
    // создаем функцию, которое будет удаляет из очереди элементы и возвращает удаленный элемент
    mutating func dequeue() -> T? {
        // проверяем, что связанный список не пустой и есть голова у списка, так как в очереди удаляется первый элемент, который в связанном списке является головой
        guard !list.isEmpty, let element = list.first else { return nil }
        
        // здесь используем заготовку remove из структуры NewLinkedList
        list.remove(node: element)
        return element.value
    }
    
    // функция, которая отображает первый элемент очереди (просто показывает первый объект очереди)
    mutating func peek() -> T? {
        list.first?.value
    }
    
    var description: String {
        list.description
    }
    
}

var queueTest = Queue<Int>()

queueTest.enqueue(element: 3)
queueTest.enqueue(element: 4)
queueTest.enqueue(element: 5)
queueTest.enqueue(element: 6)


queueTest.dequeue()
print(queueTest)
queueTest.dequeue()
queueTest.peek()

print("\nУрок 14 - Расширение доступной части игрового поля при нажатии в игре «Сапер»\n")

// создаем функцию, которая принимает поле и значения координаты точки, которую мы нажимаем
func click(field: inout [[Int]], givenI: Int, givenJ: Int) -> [[Int]] {
    
    /*
     1. Создается пустая очередь с типом `[Int]`, которая будет использоваться для хранения позиций объектов, находящихся рядом с выбранной пользователем ячейкой.
     2. Получается количество строк в поле и сохраняется в константу `row`.
     3. Получается количество столбцов в поле (путем получения количества объектов в первой строке) и сохраняется в константу `columns`.
     4. Проверяется значение ячейки в указанных координатах `givenI` и `givenJ`. Если значение равно 0, то оно заменяется на -2 и добавляется в очередь. Если значение не равно 0, то поле остается неизменным и возвращается без изменений.
     5. Запускается цикл `while`, который выполняется, пока очередь не станет пустой.
     6. В каждой итерации цикла извлекается позиция объекта из очереди.
     7. Для каждого соседнего объекта вокруг выбранной позиции проверяется следующее:
        - Если координаты `i` и `j` находятся в пределах поля и значение соседнего объекта равно 0, то:
          - Значение соседнего объекта меняется на -2.
          - Позиция соседнего объекта добавляется в очередь.
     8. После прохождения через все соседние объекты вокруг выбранной позиции, цикл продолжает работу с новыми позициями, добавленными в очередь.
     9. Когда очередь становится пустой, возвращается измененное поле, где значения ячеек, доступных из исходной выбранной ячейки, заменены на -2.

     Таким образом, функция выполняет "раскрытие" ячеек, начиная с выбранной пользователем ячейки и расширяясь на соседние ячейки, у которых значение равно 0.
     */
    
    // создаем структуру данных - очередь. Она будет содержать в себе позиции объектов, которые находятся рядом с ячейкой,  выбранной пользователей
    var queue = Queue<[Int]>()
    
    // создаем константу, которая будет содержать количество строк
    let row = field.count
    
    // создаем константу, которая будет содержать количество столбцов (то есть берем первый объект столбца и считает сколько таких объектов)
    let coloumns = (field.first?.count)!
    
    // если ячейка, по назначенным координатам равно 0, то меняем её на -2 и добавляем в очередь
    if field[givenI][givenJ] == 0 {
        field[givenI][givenJ] = -2
        queue.enqueue(element: [givenI, givenJ])
    } else {
        return field
    }
    
    while !queue.isEmpty {
        // удалять из очереди и фиксировать его позицию
        let position = queue.dequeue()
        // проверяем, если у поля соседние / смежные объекты
        for i in (position?.first)! - 1...(position?.first)! + 1 {
            for j in (position?.last)! - 1...(position?.last)! + 1 {
                // если элемент i и j находятся в пределах поля и соседний объект равняется 0
                if (0 <= i) && (i < row) && (0 <= j) && (j < coloumns) && (field[i][j] == 0) {
                    // то у смежного объекта меняем значения на -2
                    field[i][j] = -2
                    queue.enqueue(element: [i,j])
                }
            }
        }
    }
    
    return field
}

// поле берем с прошлых уроков (урок 12)
var field14 = saper(bombs: [[0,4], [3,1]], rows: 4, columns: 5)
field14.map { (array) in print(array)}

let newField = click(field: &field14, givenI: 2, givenJ: 3)
print("------------------")
newField.map { (array) in print(array)}

print("\nУрок 15 - Реализовать поиск объекта в Binary Tree\n")
/*
 Иерархическая структура данных, каждый элемент которого имеет не больше 2 потомков
 */

class Node {
    var value: Int
    let leftChild: Node?
    let rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// правая ветвь
let thiteenNode = Node(value: 13, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let fifteenNode = Node(value: 15, leftChild: thiteenNode, rightChild: twentyNode)
// левая ветвь
let dvaNode = Node(value: 2, leftChild: nil, rightChild: nil)
let sixNode = Node(value: 6, leftChild: dvaNode, rightChild: nil)

let headNode = Node(value: 12, leftChild: sixNode, rightChild: fifteenNode)

func search(node: Node?, searchValue: Int) -> Bool {
    /*
     1. Проверяется, является ли узел (`node`) равным `nil`. Если это так, то достигнут конец дерева, и значение не найдено. В этом случае возвращается `false`, указывая на неудачу в поиске.
     2. Затем проверяется, равно ли значение узла (`node?.value`) искомому значению (`searchValue`). Если значения равны, то искомое значение найдено, и функция возвращает `true`.
     3. Если искомое значение меньше значения узла (`searchValue < node!.value`), то функция вызывает себя рекурсивно для левого потомка узла (`node?.leftChild`). Таким образом, поиск продолжается в левой ветви дерева.
     4. Если искомое значение больше или равно значению узла, то функция вызывается рекурсивно для правого потомка узла (`node?.rightChild`). Таким образом, поиск продолжается в правой ветви дерева.
     Функция `search` выполняет рекурсивный поиск значения во всем дереве, двигаясь от корневого узла (`headNode`) к листьям дерева, пока не будет найдено искомое значение или достигнут конец дерева.
     */
    if node == nil {
        return false
    }
    if node?.value == searchValue {
        return true
    } else if searchValue < node!.value {
        return search(node: node?.leftChild, searchValue: searchValue)
    } else {
        return search(node: node?.rightChild, searchValue: searchValue)
    }
}

print(search(node: headNode, searchValue: 13))

print("\nУрок 16 - Поиск максимальной глубины в Binary Tree\n")

/*
 Что такое глубина бинарного дерева? - это цифра, сколько у нас есть узлов, т.е сколько раз повторяется одно и тоже действие
 */

func maxDepth(head: Node?) -> Int {
    /*
     1. Проверяется, является ли `head` равным `nil`. Если это так, значит дерево пустое, и максимальная глубина равна 0. В этом случае функция возвращает 0.
     2. Создается переменная `maxLevel`, которая будет отслеживать текущий максимальный уровень (глубину) дерева.
     3. Создается очередь (`queue`), в которой будут храниться узлы для обхода. Начально очередь заполняется корневым узлом `head` с помощью метода `enqueue(element:)`.
     4. Запускается цикл `while`, который будет выполняться, пока очередь не станет пустой. Внутри цикла каждый уровень дерева обрабатывается отдельно.
     5. Внутри цикла увеличивается значение `maxLevel` на 1, чтобы отразить переход на следующий уровень дерева.
     6. Запоминается текущее количество узлов в очереди `count` с помощью метода `count`.
     7. Выполняется цикл `for` от 0 до `count - 1`. Внутри цикла извлекается текущий узел `current` из очереди с помощью метода `dequeue()`.
     8. Проверяются наличие левого и правого потомков для текущего узла `current`. Если они существуют, то они добавляются в очередь `queue` с помощью метода `enqueue(element:)`.
     9. По завершении внутреннего цикла переходит к следующему уровню дерева, пока не будут обработаны все узлы.
     10. Когда цикл `while` завершается, возвращается значение `maxLevel`, которое представляет максимальную глубину (уровень) дерева.
     Таким образом, функция выполняет обход дерева в ширину с использованием очереди, подсчитывает количество уровней и возвращает максимальную глубину дерева.
     */
    guard let head = head else {return 0}
    var maxLevel = 0
    
    var queue = Queue<Node>()
    queue.enqueue(element: head)
    
    while !queue.isEmpty {
        maxLevel += 1
        let count = queue.count
        for _ in 0..<count {
            let current = queue.dequeue()
            if let left = current?.leftChild {
                queue.enqueue(element: left)
            }
            if let right = current?.rightChild {
                queue.enqueue(element: right)
            }
        }
    }
    return maxLevel
}

print(maxDepth(head: headNode))
