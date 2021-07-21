import Foundation

var value = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = value[0] + value[1]
print(result)
