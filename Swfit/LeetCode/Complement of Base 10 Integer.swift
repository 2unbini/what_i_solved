class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        let binary = String(n, radix: 2)
        let converted = convertBinary(binary)
        let answer = Int(converted, radix: 2)!
        return answer
    }
    
    func convertBinary(_ n: String) -> String {
        let arr = n.map { String($0) }
        var ret = ""
        
        for i in arr {
            ret = i == "1" ? ret + "0" : ret + "1"
        }
        return ret
    }
}
