class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0
        var right = n - 1
        
        while (left < right) {
            var mid = (left + right) / 2
            
            if (mid > 0 && nums[mid] == nums[mid - 1]) {
                // same left
                // 1. 찾는 수가 왼쪽에 있는지 오른쪽에 있는지 판별 - 홀수인 것
                // 2. 왼쪽에 있다면 r을 m-2로,
                // 3. 오른쪽에 있다면 l을 m+1로
              
                let leftCnt = mid - 1
              
                if leftCnt % 2 != 0 {
                    right = mid - 2
                } else {
                    left = mid + 1
                }
                
            } else if (mid < n - 1 && nums[mid] == nums[mid + 1]) {
                // same right
                // 1. 위와 동일
                // 2. 왼쪽에 있다면 r을 m-1로,
                // 3. 오른쪽에 있다면 l 을 m+2로
              
                let leftCnt = mid
                
                if leftCnt % 2 != 0 {
                    right = mid - 1
                } else {
                    left = mid + 2
                }
            } else {
                return nums[mid]
            }
        }
        return nums[left]
    }
}

/*
1,1,2,2,3,3,4,4,5,6,6 1조건문
0 1 2 3 4 5 6 7 8 9 1
l         m l   m   r
1,2,2,3,3,4,4,5,5,6,6 2조건문
0 1 2 3 4 5 6 7 8 9 1
l r m   r m         r
*/
