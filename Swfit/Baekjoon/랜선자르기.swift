func solution() -> Void {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    var K = input[0]
    let N = input[1]
    var lanArray = [Int]()

    while K != 0 {
        let value = Int(readLine()!)!
        lanArray.append(value)
        K -= 1
    }

    if N == 1 {
        print(lanArray[0])
        return
    }

    let sortedArray = lanArray.sorted()
    var s = 1
    var e = sortedArray[sortedArray.count - 1]
    var lanLen = 0

    while s <= e {
        var lanCnt = 0
        let mid = (s + e) / 2
        
        for i in lanArray {
            lanCnt += (i / mid)
        }
        
        if lanCnt >= N {
            s = mid + 1
            lanLen = mid
        } else {
            e = mid - 1
        }
    }

    print(lanLen)
}

solution()
