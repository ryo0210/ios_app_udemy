import Foundation

let pizzaInInches: Int = 16
var numberOfPeople: Int = 12
let slicePerPerson: Int = 4

var numberOfSlices: Int {

    // ゲッター：プロパティの値を取得する時に入力も出力もない場合は、メソッドではなくゲッターを使う。
    // "get {}"は省略できる。getのみで、setが書かれていない時は読み取り専用になる。
    get {
        return pizzaInInches - 4
    }
    // セッター：値が設定された時に実行する必要がある場合。
    // "newValue"という特別な変数があり、numberOfSlicesに与えられた値と等しくなる。今回の場合は13になる。
    set {
        print(newValue)
    }
}

var numberOfPizza: Int {
    get {
        return numberOfPeople / (numberOfSlices / slicePerPerson)
    } set {
        numberOfPeople = numberOfSlices * newValue / slicePerPerson
    }
}

//numberOfSlices = 13

numberOfPizza = 6
print(numberOfPeople)

