class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var array = [Int]()
        
        func backtracking(_ madeArray: inout [Int], _ index: Int, _ target: Int) {

            if target == 0 {
                result.append(madeArray)
                return
            }
            
            for i in index..<candidates.count {
                if candidates[i] <= target {
                    madeArray.append(candidates[i])
                    backtracking(&madeArray, i, target - candidates[i])
                    madeArray.popLast()
                }
            }
        }
        
        backtracking(&array, 0, target)
        return result
    }
}
