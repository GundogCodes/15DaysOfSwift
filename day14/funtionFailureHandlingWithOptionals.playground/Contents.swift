// HANDLING FUNCTION FAILURES WITH OPTIONALS
import Cocoa

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id:Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
