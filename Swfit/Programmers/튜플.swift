// string.components(separatedBy:) => separatedBy의 인자로 들어간 String 제외한 배열 만들어줌
// dictionary default value => dict[key_val, default: default_val]

import Foundation

func solution(_ s:String) -> [Int] {
    let filteredS = s.components(separatedBy: ["{", ",", "}"]).filter { $0 != "" }
    var frequency = [Int:Int]()
    var result = [Int]()
    
    for i in filteredS {
        frequency[Int(i)!, default: 0] += 1
    }
    
    var sortedFrequency = frequency.sorted { $0.1 > $1.1 }
    for (num, count) in sortedFrequency {
        result.append(num)
    }
    
    return result
}
