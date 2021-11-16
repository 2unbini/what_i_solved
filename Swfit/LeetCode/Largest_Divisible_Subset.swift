class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var answer = [Int]()
        var sortedNums = nums.sorted()
        let numsCount = nums.count
        var dp = Array(repeating: 0, count: nums.count + 1)
        var prev = Array(repeating: -1, count: nums.count + 1)
        var prevIndex = 0
        
        // dp
        for i in 0..<numsCount {
            for j in (i + 1)..<numsCount {
                if sortedNums[j] % sortedNums[i] == 0 && dp[j] < dp[i] + 1 {
                    prev[j] = sortedNums[i]
                    dp[j] = dp[i] + 1
                }
            }
        }
      
        // find largest index
        for i in 0..<numsCount {
            if dp[i] > dp[prevIndex] {
                prevIndex = i
            }
        }
        
        // backtracking divisible subsets
        while (prev[prevIndex] != -1) {
            answer.append(sortedNums[prevIndex])
            prevIndex = sortedNums.firstIndex(of: prev[prevIndex])!
        }
        answer.append(sortedNums[prevIndex])
        
        return answer
    }
}
