class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var answer = 0
        var xx = x
        var yy = y
        
        while (xx != 0 || yy != 0) {
            let xAndOne = xx & 1
            let yAndOne = yy & 1
            
            if ((xAndOne ^ yAndOne) == 1) {
                answer += 1
            }
            xx = xx >> 1
            yy = yy >> 1
        }

        return answer
    }
}

