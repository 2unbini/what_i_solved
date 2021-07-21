import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var updatedProgresses = progresses
    var i = 0
    var days = 0
    var completeArr = Array(repeating: -1, count: 100)
    var ret = [Int]()
    
    while i < progresses.count {
        updatedProgresses[i] += speeds[i] * days
        while updatedProgresses[i] <= 100 {
            if updatedProgresses[i] == 100 {
                break
            }
            updatedProgresses[i] += speeds[i]
            days += 1
        }
        if completeArr[days] == -1 {
            completeArr[days] = 1
        } else {
            completeArr[days] += 1
        }
        i += 1
    }
    
    for i in completeArr {
        if i != -1 {
            ret += [i]
        }
    }
    
    return ret
}
