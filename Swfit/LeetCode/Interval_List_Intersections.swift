class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var answer = [[Int]]()
        var sListIndex = 0
        
        if firstList.isEmpty || secondList.isEmpty {
            return answer
        }
        
        for fListElem in firstList {
            let fStart = fListElem[0]
            let fEnd = fListElem[1]
            
            for sListElem in secondList {
                let sStart = sListElem[0]
                let sEnd = sListElem[1]
                
                let startPoint = max(fStart, sStart)
                let endPoint = min(fEnd, sEnd)
                
                if (startPoint <= endPoint) {
                    answer.append([startPoint, endPoint])
                }
            }
        }
        
        return answer
    }
}

// Another Solution
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var answer = [[Int]]()
        var fIndex = 0
        var sIndex = 0
        
        if firstList.isEmpty || secondList.isEmpty {
            return answer
        }
        
        while fIndex < firstList.count && sIndex < secondList.count {
            let startPoint = max(firstList[fIndex][0], secondList[sIndex][0])
            let endPoint = min(firstList[fIndex][1], secondList[sIndex][1])
            
            if startPoint <= endPoint {
                answer.append([startPoint, endPoint])
            }
            
            if firstList[fIndex][1] < secondList[sIndex][1] {
                fIndex += 1
            }
            else {
                sIndex += 1
            }
        }
        
        return answer
    }
}
