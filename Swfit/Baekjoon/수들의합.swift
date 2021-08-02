func solution() {
    let S = Int(readLine()!)!
    var n = 1
    
    while true {
        if (n * (n + 1)) / 2 >= S {
            break
        }
        n += 1
    }
    
    S == (n * (n + 1)) / 2 ? print(n) : print(n - 1)
}

solution()
