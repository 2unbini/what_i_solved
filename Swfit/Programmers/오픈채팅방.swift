import Foundation

func solution(_ record:[String]) -> [String] {
    var resultArray: [String] = []
    var actionIdName: [[String]] = []
    var userCurrentName: [String: String] = [:]
    
    for oneStatus in record {
        var arr = oneStatus.components(separatedBy:" ")
        if arr.count < 3 {
            arr += [userCurrentName[arr[1]]!]
        }
        actionIdName += [arr]
        userCurrentName[arr[1]] = arr[2]
    }
    
    for arr in actionIdName {
        var retString = ""
        let action = arr[0]
        let id = arr[1]
        let name = userCurrentName[id]!
        
        switch action {
            case "Enter":
                retString += "님이 들어왔습니다."
            case "Leave":
                retString += "님이 나갔습니다."
            case "Change":
                continue
            case _:
                break
        }
        retString = name + retString
        resultArray += [retString]
    }
    
    return resultArray
}
