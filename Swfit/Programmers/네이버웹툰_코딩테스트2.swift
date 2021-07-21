import Foundation

func solution(_ n:Int, _ clockwise:Bool) -> [[Int]] {
    var squareArr = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
    var i = 0, j = 0, k = 0, count = 0, circle = 0
    var putNum = 1, startNum = 1, direction = 1
    var repeatLen = n - 1
    
    if n == 1 {
        return [[1]]
    } else if n == 2 {
        return [[1], [1], [1], [1]]
    }
    
    if clockwise == true {
        while true {
            k = 0
            putNum = startNum
            while k < repeatLen {
                squareArr[i][j] = putNum
                putNum += 1
                count += 1
                j += direction
                k += 1
            }
            if (count == n * n) {
                break
            }
            k = 0
            putNum = startNum
            while k < repeatLen {
                squareArr[i][j] = putNum
                putNum += 1
                count += 1
                i += direction
                k += 1
            }
            direction *= -1
            circle += 2
            if (circle == 4) {
                startNum = putNum
                i += 1
                j += 1
                repeatLen -= 2
                if (repeatLen == 0) {
                    squareArr[(n - 1) / 2][(n - 1) / 2] = startNum
                    return squareArr
                }
                circle = 0
            }
        }
    } else {
        while count <= n * n {
            k = 0
            putNum = startNum
            while k < repeatLen {
                squareArr[j][i] = putNum
                putNum += 1
                count += 1
                j += direction
                k += 1
            }
            if (count == n * n) {
                break
            }
            k = 0
            putNum = startNum
            while k < repeatLen {
                squareArr[j][i] = putNum
                putNum += 1
                count += 1
                i += direction
                k += 1
            }
            direction *= -1
            circle += 2
            if (circle == 4) {
                startNum = putNum
                i += 1
                j += 1
                repeatLen -= 2
                if (repeatLen == 0) {
                    squareArr[(n - 1) / 2][(n - 1) / 2] = startNum
                    return squareArr
                }
                circle = 0
            }
        }
    }
    
    return squareArr
}

print(solution(5, true))
