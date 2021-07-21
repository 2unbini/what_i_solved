import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucksArray = truck_weights
    var bridgeQueue = [Int]()
    var truckTime = [Int]()
    var wholeWeight = 0
    var time = 0
    
    while true {
        if let truckWeight = trucksArray.first {
            if wholeWeight + truckWeight <= weight {
                bridgeQueue.append(trucksArray.removeFirst())
                truckTime.append(0)
                wholeWeight += truckWeight
            }
        }
        
        for i in 0..<truckTime.count {
            truckTime[i] += 1
        }
        
        if truckTime.first == bridge_length {
            let firstTruck = bridgeQueue.removeFirst()
            wholeWeight -= firstTruck
            truckTime.removeFirst()
        }
        
        time += 1
        if trucksArray.isEmpty && truckTime.isEmpty {
            break
        }
    }
    
    return time + 1
}
