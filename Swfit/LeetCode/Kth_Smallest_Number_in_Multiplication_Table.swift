// binary search using smaller numbers of the target number(mid)

class Solution {
    
    func smallerNumberCount(_ m: Int, _ n: Int, _ target: Int) -> Int {
        var count = 0
        
        for i in 1...m {
            count += min(target / i, n)
        }
        
        return count
    }
    
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var left = 1
        var right = m * n
        
        while (left < right) {
            var mid = (left + right) / 2
            var count = smallerNumberCount(m, n, mid)
            
            if (count < k) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
