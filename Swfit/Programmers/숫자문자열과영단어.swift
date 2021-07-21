import Foundation

func solution(_ s:String) -> Int {
    let numString = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let numArr: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var ret = s
    var count = 0
    
    if Int(s) != nil {
        return Int(s)!
    } else {
        for (i, elem) in numString.enumerated() {
            if s.contains(elem) {
                ret = ret.replacingOccurrences(of: elem, with: numArr[i])
            } else {
                continue
            }
        }
    }
    if ret.contains("0") {
        count += 1
    }
    return count > 1 ? 0 : Int(ret)!
}
