import Foundation

// 1. type 각 하나씩 입는 경우 + 안 입는 경우 => count + 1
// 2. 각 type의 count + 1을 곱하면 전체 조합이 만들어짐
// 3. 근데 이 때, 모든 type을 안 입는 경우도 포함돼있으므로 마지막에 cases - 1 해 줌

func solution(_ clothes:[[String]]) -> Int {
    var cases = 1
    var countOfEachType = [String:Int]()
    
    for cloth in clothes {
        if countOfEachType[cloth[1]] == nil {
            countOfEachType[cloth[1]] = 1
        } else {
            countOfEachType[cloth[1]]! += 1
        }
    }
    
    for (_, count) in countOfEachType {
        cases *= (count + 1) // 1, 2
    }
    
    return cases - 1 // 3
}
