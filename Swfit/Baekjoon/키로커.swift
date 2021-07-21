
// first solution
// got timeout
var loopCnt = Int(readLine()!)!

while loopCnt != 0 {
    let inputPasswd = readLine()!.compactMap{String($0)}
    var password = [String]()
    var index = 0
    var i = 0
    
    while i < inputPasswd.count {
        switch inputPasswd[i] {
        case "<":
            index = index <= 0 ? 0 : index - 1
        case ">":
            index = index >= password.count ? password.count : index + 1
        case "-":
            if password.isEmpty {
                fallthrough
            } else {
                if index >= password.count {
                    index -= 1
                }
                password.remove(at: index)
            }
        default:
            if password.isEmpty || index == password.count {
                password.append(inputPasswd[i])
                index += 1
            } else {
                password.insert(inputPasswd[i], at: index)
            }
        }
        i += 1
    }
    
    print(password.joined())
    loopCnt -= 1
}


// second solution
// passed
var loopCnt = Int(readLine()!)!

while loopCnt != 0 {
    let inputPasswd = readLine()!.compactMap{String($0)}
    var leftStack = [String]()
    var rightStack = [String]()
    var i = 0
    
    while i < inputPasswd.count {
        switch inputPasswd[i] {
        case "<":
            if leftStack.isEmpty == false {
                rightStack.append(leftStack.removeLast())
            }
        case ">":
            if rightStack.isEmpty == false {
                leftStack.append(rightStack.removeLast())
            }
        case "-":
            if leftStack.isEmpty == false {
                leftStack.removeLast()
            }
        default:
            leftStack.append(inputPasswd[i])
        }
        i += 1
    }
    print(leftStack.joined() + rightStack.reversed().joined())
    loopCnt -= 1
}
