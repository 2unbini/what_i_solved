import Foundation

// first solution
func cmpNum(_ a:String, _ b:String) -> Bool {
    let numA = Int(a + b)!
    let numB = Int(b + a)!
    
    if (numA > numB) {return true}
    return false
}

func solution(_ numbers:[Int]) -> String {
    let numString: String = numbers.map{String($0)}.sorted(by: cmpNum(_:_:)).joined()
    var zero = 0
    for i in numbers {
        if (i == 0) {
            zero += 1
        }
    }
    if (zero == numbers.count) {return "0"}
    return numString
}

// second solution
func solution(_ numbers:[Int]) -> String {
		return numbers.map{String($0)}.sorted{Int($0 + $1)! > Int($1 + $0)!}.joined()
}
