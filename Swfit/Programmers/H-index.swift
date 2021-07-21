import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted()
    var hMax = 0
    
    for i in 0...sortedCitations.count {
        var citationCnt = 0
        for paper in sortedCitations {
            if paper >= i {
                citationCnt += 1
            }
        }
        if (citationCnt >= i) {
            hMax = i
        }
    }
    return hMax
}
