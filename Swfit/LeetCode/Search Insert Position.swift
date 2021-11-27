// Binary Search w Upper Bound

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0
        var right = nums.count
        
        while left < right {
            var mid = (left + right) / 2
            if target <= nums[mid] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
