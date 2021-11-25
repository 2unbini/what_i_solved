class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = nums
        
        for i in 1..<nums.count {
            dp[i] = max(dp[i], dp[i - 1] + nums[i])
        }
        
        return dp.max()!
    }
}
