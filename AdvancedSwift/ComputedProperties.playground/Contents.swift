import Foundation

var pizzaInInches: Int = 10 {
    // 実際にはあり得ない数字にならないように、いつ変更されるかを監視する。
    
    // 変更直前
    willSet {
        print(pizzaInInches) // 変更前の値（10）
        print(newValue) // 新しい値（33）
    }
    // 変更直後
    didSet {
        print(oldValue) //以前の値（10）
        if pizzaInInches >= 18 {
            print("無効なサイズが指定されたので、pizzaInInchesを18に設定しました。")
            pizzaInInches = 18
        }
        print(pizzaInInches) // 変更後の値（18）
    }
}


pizzaInInches = 33
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

