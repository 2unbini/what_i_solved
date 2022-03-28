class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            print("\(nums[mid]), \(mid)")
            
            // 찾으면 return true
            if target == nums[mid] {
                return true
            }
            
            // 못찾으면 범위 줄이기
            // 정렬된 부분 찾기
            
            // 왼쪽 정렬됨
            if nums[left] < nums[mid] {
                // 타겟 있음 -> 범위 좁히기
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                }
                // 타겟 없음 -> 오른쪽으로 넘어가기
                else {
                    left = mid + 1
                }
            }
            // 오른쪽 정렬됨
            else if nums[left] > nums[mid] {
                // 타겟 있음 -> 범위 좁히기
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                }
                // 타겟 없음 -> 왼쪽으로 넘어가기
                else {
                    right = mid - 1
                }
            }
            // 중복되는 숫자 있음
            // 왼쪽을 하나 더해서 중복되지 않는 상태로 만들어줌
            else {
                left += 1
            }
        }
        
        return false
    }
}
