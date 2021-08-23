
import Foundation

func splitString(_ p: String) -> [String] {
    var uCnt = [0, 0]
    var u = ""
    var v = ""
    
    for (i, char) in p.enumerated() {
        if char == "(" {
            uCnt[0] += 1
        } else if char == ")" {
            uCnt[1] += 1
        }
        
        u += String(char)
        
        if uCnt[0] == uCnt[1] {
            let strIndex = p.index(p.startIndex, offsetBy: i + 1)
            v = String(p[strIndex...])
            break
        }
    }
    
    return [u, v]
}

func isValidString(_ str: String) -> Bool {
    var queue = [String]()

    for k in str {
        if !queue.isEmpty && queue.last! == "(" && String(k) == ")" {
            queue.removeLast()
            continue
        }
        queue.append(String(k))
    }
    
    return queue.isEmpty
}

func editString(_ u: String) -> String {
    var editableU = u.map{String($0)}
    
    editableU.removeFirst()
    editableU.removeLast()
    
    for i in 0..<editableU.count {
        if editableU[i] == "(" {
            editableU[i] = ")"
        } else if editableU[i] == ")" {
            editableU[i] = "("
        }
    }
    
    return editableU.joined()
}

func solution(_ p:String) -> String {
    var ret = ""
    let spString = splitString(p)
    let u = spString[0]
    let v = spString[1]
    
    if p == "" {
        return ""
    }
    
    if isValidString(u) == true {
        ret = u + solution(v)
    }
    else {
        ret += "(" + solution(v) + ")"
        ret += editString(u)
    }
    
    return ret
}
