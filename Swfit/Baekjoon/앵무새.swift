// failed

var cnt = Int(readLine()!)!

var eachParrotSays = [[String]]()
while cnt != 0 {
    let say = readLine()!.split(separator: " ").compactMap{ String($0) }
    eachParrotSays.append(say)
    cnt -= 1
}
var written = readLine()!.split(separator: " ").compactMap{ String($0) }

func solution() -> String {
    var i = 0
    var j = 0
    let writtenCnt = written.count
    let parrotCnt = eachParrotSays.count
    var hasWord = false
    
    while i < writtenCnt {
        j = 0
        hasWord = false
        while j < parrotCnt {
            if eachParrotSays[j].isEmpty == false && written.first == eachParrotSays[j].first {
                written.removeFirst()
                eachParrotSays[j].removeFirst()
                hasWord = true
                break
            } else {
                j += 1
            }
        }
        if hasWord == false {
            return "Impossible"
        }
        i += 1
    }
    
    i = 0
    while i < parrotCnt {
        if eachParrotSays[j].isEmpty == false {
            return "Impossible"
        }
        i += 1
    }
    
    return "Possible"
}

print(solution())
