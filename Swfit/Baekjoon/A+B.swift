import Foundation

var value = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
var result = value[0] + value[1]
print(result)
