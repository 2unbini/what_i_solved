//No.2

import Foundation

func solution(_ actions:[String]) -> [String] {
    var actList = [[String]]()
    var retList = [[String]]()
    for list in actions {
        actList.append(list.split(separator: " ").compactMap{ String($0) })
    }
    
    var wholeNum = 0
    
    for list in actList {
        var tmpList = [String]()
        switch list[1] {
            case "deposit":
            wholeNum += Int(list[3])!
            tmpList += [list[0], "입금", list[2], list[3]]
            case "withdraw":
            wholeNum -= Int(list[3])!
            tmpList += [list[0], "출금", list[2], list[3]]
            case "change":
            for (i, elem) in retList.enumerated() {
                if !elem.isEmpty && list[0] == elem[0] {
                    retList[i][2] = list[2]
                    retList[i][3] = list[3]
                    if elem[1] == "입금" {
                        wholeNum = wholeNum - Int(elem[3])! + Int(list[3])!
                    } else if elem[1] == "출금" {
                        wholeNum = wholeNum + Int(elem[3])! - Int(list[3])!
                    }
                }
            }
            default:
            continue
        }
        retList += [tmpList]
    }
    
    var retStr = [String]()
    
    for elem in retList {
        if !elem.isEmpty {
            retStr.append(elem[1] + " " + elem[2] + " " + elem[3] + "원")
        }
    }
    retStr.append(String(wholeNum) + "원")
    
    return retStr
}
