class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        let alphabets = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
        var stringArray = Array(repeating: "a", count: n)
        var remainedAlphabetCount = k - n
 
        for i in stride(from: n - 1, to: -1, by: -1) {
            if remainedAlphabetCount == 0 || i == -1 { break }
            let maxAlphabetCount = remainedAlphabetCount > 25 ? 25 : remainedAlphabetCount
            stringArray[i] = alphabets[maxAlphabetCount]
            remainedAlphabetCount -= maxAlphabetCount
        }
        
        
        return stringArray.joined()
    }
}
