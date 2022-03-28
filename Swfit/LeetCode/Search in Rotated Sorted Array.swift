// 뭔가 찾아야되는데 O(logn) => 이분탐색..

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            // 찾았을 때 바로 리턴
            if nums[mid] == target {
                return mid
            }
            
            // 왼쪽이 정렬되어있음
            if nums[left] <= nums[mid] {
                
                // 정렬된 왼쪽에 target 있음
                // 왼쪽으로 범위 줄이기
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                }
                // target 없음
                // 오른쪽으로 범위 넘어가기
                else {
                    left = mid + 1
                }
            }
            // 오른쪽이 정렬되어있음
            else {
                
                // 정렬된 오른쪽에 target 있음
                // 오른쪽으로 범위 줄이기
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                }
                // target 없음
                // 왼쪽으로 범위 넘어가기
                else {
                    right = mid - 1
                }
            }
        }
        
        // 인덱스 못 찾음
        return -1
    }
}
