// 두 값의 차가 큰 순서대로 정렬
// 더 작은 값이 있는 위치 += 1, result += 더 작은 값
// 각 위치에 n만크 다 차면 그냥 result += 큰 값
// 같은 값들은 가장 최솟값들이 들어가고 남은 곳에 들어가면 되므로 마지막에 result += sumOfSameCosts()

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var n = costs.count / 2
        var aCount = 0
        var bCount = 0
        var result = 0
        var sameCosts = [Int]()
        var minusSortedCosts = costs.sorted { first, second in
            return abs(first[0] - first[1]) > abs(second[0] - second[1])
        }
        
        for cost in minusSortedCosts {
            if cost[0] < cost[1] {
                if aCount < n {
                    result += cost[0]
                    aCount += 1
                } else {
                    result += cost[1]
                    bCount += 1
                }
            }
            else if cost[1] < cost[0] {
                if bCount < n {
                    result += cost[1]
                    bCount += 1    
                } else {
                    result += cost[0]
                    aCount += 1
                }
            }
            else {
                sameCosts.append(cost[0])
            }
        }
        
        return sameCosts.isEmpty ? result : result + sumOfSameCosts(sameCosts)
    }
    
    func sumOfSameCosts(_ array: [Int]) -> Int {
        var sum = 0
        
        for cost in array {
            sum += cost
        }
        
        return sum
    }
}
