import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numArr = number.map{String($0)}
    let ansCnt = numArr.count - k
    var ansArr = [String]()
    var removedCnt = 0
    
    for (i, num) in numArr.enumerated() {
        if ansArr.isEmpty {
            ansArr.append(num)
        }
        else {
            while !ansArr.isEmpty && ansArr.last! < num && removedCnt < k {
                ansArr.popLast()
                removedCnt += 1
            }
            if ansArr.count < ansCnt {
                ansArr.append(num)
            }
        }
    }
    
    return ansArr.joined()
}
