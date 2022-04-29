import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported = [String: Set<String>]()
    var count = [String: Int]()
    
    for list in report {
        let parsedList = list.split(separator: " ").map { String($0) }
        reported[parsedList[1], default: []].insert(parsedList[0])
    }
    for (reportedUser, reportUsers) in reported {
        if reportUsers.count >= k {
            for user in reportUsers {
                count[user, default: 0] += 1
            }
        }
    }
    
    var answer = [Int]()
    
    for id in id_list {
        if let count = count[id] {
            answer.append(count)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}
