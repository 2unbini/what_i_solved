import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var ret: [Character] = []
    let whole = numbers.count - 1
    var num = 0
	var sub = 0
	let numpos = [[4, 2], [1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3], [4, 1], [4, 3]]
    var leftThumb: Int = 10
    var rightThumb: Int = 11
	
    for i in 0...whole {
        num = numbers[i]
        if num == 1 || num == 4 || num == 7 {
            ret.append("L")
            leftThumb = num
        } else if num == 3 || num == 6 || num == 9 {
            ret.append("R")
            rightThumb = num
        } else {
			let rlen = abs(numpos[num][0] - numpos[rightThumb][0]) + abs(numpos[num][1] - numpos[rightThumb][1])
			let llen = abs(numpos[num][0] - numpos[leftThumb][0]) + abs(numpos[num][1] - numpos[leftThumb][1])
            sub = llen - rlen
			if (sub > 0) {
                ret.append("R")
                rightThumb = num
            } else if (sub < 0) {
                ret.append("L")
                leftThumb = num
            } else {
                if (hand == "left") {
                    ret.append("L")
                    leftThumb = num
                } else if (hand == "right") {
                    ret.append("R")
                    rightThumb = num
                }
            }
        }
    }
	let result: String = String(ret)
    return result
}
