class Solution {
    let soldier = 1
    let civilian = 0
    
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var soldiersInRow = [Int: Int]()
        
        for (index, row) in mat.enumerated() {
            for elem in row {
                if elem == soldier {
                    soldiersInRow[index, default: 0] += 1
                } else if elem == civilian {
                    soldiersInRow[index, default: 0] += 0
                }
            }
        }
        
        var sortByWeak = soldiersInRow.sorted { first, second in
            if first.value == second.value {
                return first.key < second.key
            }
            return first.value < second.value
        }
        var result = [Int]()
        
        for index in 0..<k {
            result.append(sortByWeak[index].key)
        }
        
        return result
    }
}
