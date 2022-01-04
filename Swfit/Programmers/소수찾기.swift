import Foundation

func solution(_ numbers:String) -> Int {
    let numberPieces = numbers.map{ String($0) }
    var primeNums: [Int] = []
    
    recursive("", numberPieces, &primeNums)
    
    return primeNums.count
}

func recursive(_ combined: String, _ pieces: [String], _ primeNums: inout [Int]) {
    let n = pieces.count
    let currNum = combined == "" ? 0 : Int(combined)!
    
    if currNum != 0 && isPrime(currNum) {
        if !primeNums.contains(currNum) {
            primeNums.append(currNum)
        }
    }
    
    for i in 0..<n {
        var otherPieces = pieces
        otherPieces.remove(at: i)
        recursive(combined + pieces[i], otherPieces, &primeNums)
    }
}

func isPrime(_ n: Int) -> Bool {
    var divisor = 3
    
    if n == 0 || n == 1 {
        return false
    }
    
    if n % 2 == 0 {
        return n == 2 ? true : false
    }
    
    while divisor <= Int(sqrt(Double(n))) {
        if n % divisor == 0 {
            return false
        }
        divisor += 2
    }
    
    return true
}
