//PROTOCOLS
import Cocoa

protocol Vehicle {
    var name: String {get}
    var currentPassengers: Int {get set}
    func estimateTime(for distance:Int) -> Int
    func travel(distance: Int)
}
protocol CanBeElectric{
    
}

struct Car: Vehicle, CanBeElectric {
    var name = "Car"
    var currentPassengers = 4
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    func openSunroof(){
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle, CanBeElectric {
    var name = "Bike"
    var currentPassengers = 4
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

// so Bicycle and Car are 2 structs that conform to the Vehicle protocol
// thus they both must contain the estimateTime & travel methods
// and the name and currentPassengers properties as promised
// by the protocol, and can be passed in to functions that accept structs of
// the types that conform to the Vehicle protocol

func commute(distance:Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance:Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km" )
    }
}

let car = Car()
commute(distance: 100, using:  car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car,bike], distance: 150)
