class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        
        for pair in trust {
            let person = pair[0]
            let trustedPerson = pair[1]
            
            matrix[person][trustedPerson] = 1
        }
        
        for candidate in 1...n {
            var peopleWhoTrust = 0
            
            for person in 1...n {
                if candidate == person {
                    continue
                }
                if matrix[person][candidate] == 1 {
                    peopleWhoTrust += 1
                }
            }
            
            if peopleWhoTrust == n - 1 && !matrix[candidate].contains(1) {
                return candidate
            }
        }
        
        return -1
    }
}
