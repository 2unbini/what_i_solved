func solution() -> String {
    var n = Int(readLine()!)!

    var nCnt = 0
    var tempStack = [Int]()
    var resultStack = [Int]()
    var expectedStack = [Int]()
    var process: String = ""

    while n != 0 {
        let value = Int(readLine()!)!
        
        while nCnt < value {
            nCnt += 1
            tempStack.append(nCnt)
            process += "+"
        }
        let popValue = tempStack.removeLast()
        process += "-"
        resultStack.append(popValue)
        expectedStack.append(value)
        n -= 1
    }
    if resultStack != expectedStack {
        return "NO"
    } else {
        return process
    }
}

var ret = solution()

if ret == "NO" {
    print(ret)
} else {
    while ret.isEmpty == false {
        print(ret.removeFirst())
    }
}
