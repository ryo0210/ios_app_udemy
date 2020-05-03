import Foundation

var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPaint: Int {
    get {
        return Int(ceilf((width * height) / 1.5))
    } set {
        let areaCanCover = Double(newValue) * 1.5
        print("この量の塗料で\(areaCanCover)のエリアをカバーできます。")
    }
}

print(bucketsOfPaint)
bucketsOfPaint = 4
