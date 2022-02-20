// 탐색하는 경우의 수가 작다 -> 반복문 때려보는거임

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var result = [Int]()
    
    for place in places {
        let points = attendeePoint(place)
        var isOkay = true
        var placeArray = [[String]]()
        
        for row in place {
            placeArray.append(row.map{String($0)})
        }
        
        for i in 0..<points.count {
            if !isOkay { break }
            
            for j in (i + 1)..<points.count {
                let first = points[i]
                let second = points[j]
                let distance = manhattanDistance(first, second)
                
                if distance <= 1 {
                    isOkay = false
                    break
                }
                
                if distance > 2 {
                    continue
                }
                
                if first[0] == second[0] {
                    // 같은 열에 있음
                    if placeArray[first[0]][min(first[1], second[1]) + 1] == "O" {
                       isOkay = false
                        break
                    }
                }
                if first[1] == second[1] {
                    // 같은 행에 있음
                    if placeArray[min(first[0], second[0]) + 1][first[1]] == "O" {
                        isOkay = false
                        break
                    }
                }
                // 대각선에 있음
                if placeArray[first[0]][second[1]] == "O"
                || placeArray[second[0]][first[1]] == "O" {
                    isOkay = false
                    break
                }
            }
        }
        
        if isOkay { result.append(1) }
        else { result.append(0) }
    }
 
    return result
}

func manhattanDistance(_ first: [Int], _ second: [Int]) -> Int {
    return abs(first[0] - second[0]) + abs(first[1] - second[1])
}

func attendeePoint(_ places: [String]) -> [[Int]] {
    var attendeeArray = [[Int]]()
    
    for (i, row) in places.enumerated() {
        let rowArray = row.map{ String($0) }
        
        for (j, elem) in rowArray.enumerated() {
            if elem == "P" {
                attendeeArray.append([i, j])
            }
        }
    }
    
    return attendeeArray
}
