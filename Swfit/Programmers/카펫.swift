import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var cases = [[Int]]()
    let sum = brown + yellow
    let sqrtOfSum = Int(sqrt(Double(sum)))
    
    for h in 3...sqrtOfSum {
        let w = sum / h
        
        if isPossible(sum, w, h, yellow) {
            return [w, h]
        }
    }
    return []
}

func isPossible(_ sum: Int, _ w: Int, _ h: Int, _ y: Int) -> Bool {
    if y == (w - 2) * (h - 2) && sum == w * h {
        return true
    }
    return false
}
