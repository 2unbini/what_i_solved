class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var frequency: [Int: Int] = [:]
        var answer: Int = 0
        
        for num in nums {
            frequency[num, default: 0] += 1
        }
        
        for num in frequency.keys {
            if k > 0 && frequency[num - k] != nil {
                answer += 1
            }
            if k == 0 && frequency[num] != nil && frequency[num]! >= 2 {
                answer += 1
            }
        }
        
        return answer
    }
}
