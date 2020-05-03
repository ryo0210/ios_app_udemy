//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by ryo on 2020/04/29.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation

// --構造体とクラスの違い--
// 構造体はクラスと違って、継承ができない。その分、構造体は安全にすることができる。
// メモリ内の場所
// 構造体は先入れ先出しシステムのスタック。
// クラスは、そのすべてのデータがメモリに割り当てられ、ヒープのどこかにランダムで保存される。
// そして、スタックにもヒープに保存されたクラスを見つけるため参照データが保存される。
// クラスが呼ばれた場合、スタックにあるクラスの参照データを使用して見つけることができる。
// 構造体は値型で、データのコピーを格納する。
// クラスは参照型で、メモリブロックへの参照データを格納する。

// データモデルの場合はstructを使用する。

struct CalculatorLogic {
    
    private var number: Double?
    
    // 計算に必要な数と記号を一時的に保存する。
    // 辞書と違って様々なデータ型を保存する柔軟性があり構造体やクラスを作成するほど大変ではない。
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    // 構造体の変数を変化させるので、mutatingをつける。
    mutating func setNumber(_ number: Double) {
        self.number = number
    }

// classからstructに変更したので、initはいらない。
//    init (number: Double) {
//        // 左が上で定義したグローバル変数で、右がローカル変数。
//        self.number = number
//    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("operationがどのケースとも一致しません。")
            }
        }
        return nil
    }
}
