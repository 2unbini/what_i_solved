var loopCnt = Int(readLine()!)!
var stackArray = [Int]()

while loopCnt != 0 {
    let inputCommand = readLine()!.split(separator: " ")
    
    switch inputCommand[0] {
    case "push":
        stackArray.append(Int(inputCommand[1])!)
    case "pop":
        stackArray.isEmpty == true ? print(-1) : print(stackArray.removeLast())
    case "size":
        print(stackArray.count)
    case "empty":
        stackArray.isEmpty == true ? print(1) : print(0)
    case "top":
        stackArray.isEmpty == true ? print(-1) : print(stackArray[stackArray.count - 1])
    default:
        break
    }
    loopCnt -= 1
}
