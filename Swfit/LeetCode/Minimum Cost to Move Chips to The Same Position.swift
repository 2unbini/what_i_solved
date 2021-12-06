class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var count = Array(repeating: 0, count: position.count)
        
        for i in 0..<position.count {
            for j in 0..<position.count {
                if position[i] == position[j] {
                    continue
                }
                if (position[i] + position[j]) % 2 == 1 {
                    count[i] += 1
                }
            }
        }
        return count.min()!
    }
}
