// DP...!!!!

class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: 0, count: n)
        
        if n == 1 {
            return nums[0]
        } else if n == 2 {
            return max(nums[0], nums[1])
        } else {
            dp[0] = nums[0]
            dp[1] = max(nums[0], nums[1])
            
            for i in 2..<n {
                dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
            }
            return dp[n - 1]
        }
    }
}
