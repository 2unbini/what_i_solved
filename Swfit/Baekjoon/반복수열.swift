// 구현

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    
    let A = input[0]
    let P = input[1]
    var D = [0, A]
    var index = 0
    var i = 2
    
    while true {
        var preD = D[i - 1]
        var val = 0
        
        while preD != 0 {
            val += power(preD % 10, P)
            preD /= 10
        }
        
        if D.contains(val) {
            index = D.firstIndex(of: val)!
            break
        } else {
            D.append(val)
            i += 1
        }
    }
    
    print(index - 1)
}

func power(_ n: Int, _ i: Int) -> Int {
    var ret = 1
    
    for _ in 1...i {
        ret *= n
    }
    
    return ret
}

solution()
