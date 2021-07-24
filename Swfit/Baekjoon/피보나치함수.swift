var T = Int(readLine()!)!
var zeroCnt = Array(repeating: 0, count: 41)
var oneCnt = Array(repeating: 0, count: 41)

zeroCnt[0] = 1
oneCnt[1] = 1
for i in 2...40 {
    zeroCnt[i] = zeroCnt[i - 1] + zeroCnt[i - 2]
    oneCnt[i] = oneCnt[i - 1] + oneCnt[i - 2]
}

while T != 0 {
    let n = Int(readLine()!)!
    
    print("\(zeroCnt[n]) \(oneCnt[n])")
    T -= 1
}
