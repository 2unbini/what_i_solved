class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        if !nums.contains(target) {
            return -1
        }
        
        while left < right {
            let mid = (left + right) / 2
            
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
