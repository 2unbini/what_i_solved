import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    
    for (i, elem) in signs.enumerated() {
        if elem == true {
            sum += absolutes[i]
        } else {
            sum -= absolutes[i]
        }
    }
    return sum
}
