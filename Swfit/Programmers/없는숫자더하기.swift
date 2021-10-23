import Foundation

func solution(_ numbers:[Int]) -> Int {
    var sum = 45
    
    for i in numbers {
        sum -= i
    }
    
    return sum
}
