import Foundation

func solution(_ dartResult:String) -> Int {
    let arr = dartResult.map({ String($0) })
    var result = [Int](repeating: 0, count: 3)
    var setNum = 0
    var i = 0
    var j = 0
    var char: String
    
    for k in 0...(arr.count - 1) {
        char = arr[k]
        if (char >= "0" && char <= "9") {
            if (k > 0 && char == "0" && arr[k - 1] == "1") {
                result[setNum] += 9
            } else {
            result[setNum] += Int(char)!
            }
        } else if (char >= "A" && char <= "Z") {
            if char == "S" {
                i = 1
            } else if char == "D" {
                i = 2
            } else if char == "T" {
                i = 3
            }
			result[setNum] = Int(pow(Double(result[setNum]), Double(i)))
            if (k != arr.count - 1 && arr[k + 1] >= "0" && arr[k + 1] <= "9") {
                setNum += 1
            }
        } else if (char == "*") {
            if (setNum == 0) {
                result[setNum] *= 2
            } else {
                result[setNum - 1] *= 2
                result[setNum] *= 2
            }
            setNum += 1
        } else if (char == "#") {
            result[setNum] *= (-1)
            setNum += 1
        }
    }
    
    return result[0] + result[1] + result[2]
}
