// Two Pointers
// Sort
// Greedy

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var sortedPeople = people.sorted()
        var boatCount = 0
        var light = 0
        var heavy = sortedPeople.count - 1
        
        while light <= heavy {
            if sortedPeople[light] + sortedPeople[heavy] <= limit {
                light += 1
                heavy -= 1
            } else {
                heavy -= 1
            }
            boatCount += 1
        }
        
        return boatCount
    }
}
