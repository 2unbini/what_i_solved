import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var ret = n - lost.count
    var lostForUse = lost.sorted()
    var reserveForUse = reserve.sorted()
    
        for (idx, i) in lost.enumerated() {
            if reserveForUse.contains(i) {
                ret += 1
                reserveForUse = reserveForUse.filter(){ $0 != i }
                lostForUse = lostForUse.filter(){ $0 != i}
                continue
            }
        }
    
    for i in lostForUse {
        for (idx, j) in reserveForUse.enumerated() {
            if j == (i - 1) || j == (i + 1) {
                ret += 1
                reserveForUse.remove(at: idx)
                break
            }
        }
    }
    
    return ret
}
