// No.3

import Foundation

func solution(_ n:Int, _ keyInputs:[Int]) -> String {
    var password = [String]()
    
    for input in keyInputs {
        switch input {
            case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
            if password.count < n {
                password.append(String(input))
            }
            case -2:
            if !password.isEmpty {
                password.removeAll()
            }
            case -1:
            if !password.isEmpty {
                password.removeLast()
            }
            default:
            continue
        }
    }
    
    return password.count != n ? "" : password.joined()
}
