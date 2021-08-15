//No.4
// 순서 다른 같은 키밸류, 시간초과 문제 해결 X

import Foundation

func solution(_ logs: [String]) -> Int {
    var timeApiLogs = [[String]]()
    var multiApiList = [String]()
    
    for i in 0..<logs.count {
        let tmp = logs[i].split(separator: " ").compactMap { String($0) }
        let tmpTime = tmp[0].split(separator: ":").compactMap { Double($0) }
        let currTime = tmpTime[0] * 3600 + tmpTime[1] * 60 + tmpTime[2]
        let currApi = tmp[1]
        
        timeApiLogs.append([String(currTime), currApi])
    }
    
    for (i, currentLog) in timeApiLogs.enumerated() {
        let currentTime = Double(currentLog[0])!
        let currentApi = currentLog[1]
        
        for j in (i + 1)..<timeApiLogs.count {
            let someNextLogTime = Double(timeApiLogs[j][0])!
            let someNextLogApi = timeApiLogs[j][1]
            let currApiArray = currentApi.split(separator: "/").compactMap{String($0)}.joined().split(separator: "?").compactMap{ String($0) }.joined().split(separator: "&").compactMap{String($0)}
            let nextApiArray = someNextLogApi.split(separator: "/").compactMap{String($0)}.joined().split(separator: "?").compactMap{ String($0) }.joined().split(separator: "&").compactMap{String($0)}
            
            if currentTime - someNextLogTime <= 2 && currentApi == someNextLogApi {
                multiApiList.append(currentApi)
                break
            }
        }
    }
    
    return Set(multiApiList).count
}
