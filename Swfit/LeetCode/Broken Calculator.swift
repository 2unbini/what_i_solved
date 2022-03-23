// target => odd => +1
// target => even => /2
// when target < start, two cases left.
// target == start or target == start - 1
// so when iteration ends, u need to add (start - target) to operation

class Solution {
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        var operation = 0
        var start = startValue
        var target = target
    
        while target > start {
            if target % 2 == 0 {
                target /= 2
            } else {
                target += 1
            }
            operation += 1
        }
        
        return operation + start - target
    }
}
