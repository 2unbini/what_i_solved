class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        
        // N^4인 복잡도를 어떻게 줄이냐 -> 더해서 0이 나오는거니까 더하는 수들을 쪼개면 되겠지
        // 그럼 더한 값을 어떻게 저장하냐 -> Hash Table로 [sum: frequency] 저장
        // count를 반환하는것이므로 nums1 + nums2의 각 합이 몇 번 나왔는지 저장하고,
        // nums3 + nums4의 negative 값을 key로 찾으면 총 0이 되는 frequency를 구할 수 있음
        
        var tuples: [Int:Int] = [:]
        var answer: Int = 0
        
        for i in nums1 {
            for j in nums2 {
                tuples[i + j, default: 0] += 1
            }
        }
        
        for k in nums3 {
            for l in nums4 {
                answer += tuples[-1 * (k + l), default: 0]
            }
        }
        
        return answer
    }
}
