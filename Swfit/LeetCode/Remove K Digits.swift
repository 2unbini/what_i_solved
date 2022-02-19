// Greedy, Stack
// 맨 앞이 작으면 전체가 무조건 작음
// 예외에 대한 처리 많음

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var numbers: [String] = num.compactMap { String($0) }
        var stack: [String] = [numbers[0]]
        var removed: Int = 0
        var i: Int = 1
        
        if k == num.count {
            return "0"
        }
        
        while i < numbers.count {
            while removed < k && i < numbers.count && !stack.isEmpty && Int(stack.last!)! > Int(numbers[i])! {
                stack.popLast()
                removed += 1
            }
            if removed == k {
                break
            }
            stack.append(numbers[i])
            i += 1
        }
        
        while removed < k {
            stack.popLast()
            removed += 1
        }

        if i < numbers.count {
            stack += numbers[i..<numbers.count]
        }

        while !stack.isEmpty && stack.first == "0" {
            stack.removeFirst()
        }
        
        return stack.isEmpty ? "0" : stack.joined()
    }
}

// 숫자 범위 벗어난 경우 제대로 틀림 - 백트래킹

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var minimum = Int(num)!
        var numArray = num.map { String($0) }
        
        func removeDigit(_ num: inout [String], _ k: Int, _ index: Int) {
            if k == 0 {
                if num.isEmpty {
                    minimum = 0
                    return
                }
                minimum = min(minimum, Int(num.joined())!)
                return
            }
            
            for i in index..<num.count {
                let n = num[i]
                num.remove(at: i)
                removeDigit(&num, k - 1, i)
                num.insert(n, at: i)
            }
        }
        
        removeDigit(&numArray, k, 0)
        
        return String(minimum)
    }
}
