import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    
    for (i, elem) in a.enumerated() {
        sum += elem * b[i]
    }
    
    return sum
}
