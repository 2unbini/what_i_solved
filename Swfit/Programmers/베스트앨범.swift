import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var sumOfEachGenre: [String: Int] = [:]
    var n = genres.count
    var ret: [Int] = []
    
    for i in 0..<n {
        let genre = genres[i]
        let played = plays[i]
        
        if sumOfEachGenre[genre] == nil {
            sumOfEachGenre[genre] = played
            continue
        }
        
        sumOfEachGenre[genre]! += played
    }
    
    let sortedGenreSum = sumOfEachGenre.sorted { $0.1 > $1.1 }
    
    for pair in sortedGenreSum {
        let genre = pair.key
        var playsOfEachNum: [Int:Int] = [:]
        
        for i in 0..<n {
            if genres[i] == genre {
                playsOfEachNum[i] = plays[i]
            }
        }
        
        let sortedPlaysOfNum = playsOfEachNum.sorted {
            if $0.1 == $1.1 {
                return $0 < $1
            }
            return $0.1 > $1.1
        }
        var count = 0
        
        for (num, played) in sortedPlaysOfNum {
            if count == 2 {
                break
            }
            ret.append(num)
            count += 1
        }
    }
    
    return ret
}
