import Foundation

/**
 What is a protocol?
 
 - A protocol is a blueprint for an object that sets requirements for FUNCTIONS, PROPERTIES, and other specifications.
 - An object that IMPLEMENTS a protocol must CONFORM to its requirements.
 - A protocol does not implement any methods or initialize properties, so structs/classes that implement them must do that.
 - Protocols are useful in large applications to make sure that various custom objects are compatible with each other for certain processes.
 
 Common protocol examples (included in Swift):
 - Identifiable: these objects must have a property named "id".
 - Equatable these objects can be compared using the "==" and "!=" operators. Can specify "==" method for a custom type to conform.
 - Hashable: these objects can be hashed to an integer value, allowing the type to be used as the key in a dictionary or set element.
 */


// [1] Basic Protocol

/**
 Below is a basic protocol modeling a generic personal id card. We use the protocol keyword to declare the protocol.
 There are 4 property requirements and 2 function requirements for any id card.
 Read through the code and note any new keywords or syntax you see.
 */
protocol PersonalID {
    
    // Property requirements
    var firstName: String { get }
    var lastName: String { get }
    var expirationDate: String { get }
    var address: String { get set }
    
    // Function requirements
    mutating func move(newAddress: String)
    func toString() -> String
}

/**
The first thing you should notice are the property distinctions in brackets: "{ get set }" and "{ get }." These specify
how the variable must be implemented in a struct/class. Gettable and Settable properties are both readable and writable, while
Gettable properties are read-only.
 
The next thing you should notice are the function bodies, or lack thereof. Protocols do not implement any functions, so all of the implementation
is left up to the struct/class implementing it.
 
 Below, you will implement the PersonalID protocol to create a Driver's License object. Follow the steps listed to assist you.
 */

// [2] Implement DriversLicense which conforms to PersonalID and Identifiable

struct DriversLicense: PersonalID, Identifiable {
    /**
        Steps To Do:
            1. Implement the protocol requirements specified in PersonalID.
              The function implementation is up to your interpretation.
            2. Add 3 additional properties and 1 function that apply solely to
              drivers licenses.
            3. Make DriversLicense also conform to Identifiable.
     */
    var firstName: String
    var lastName: String
    var expirationDate: String
    var address: String
    
    mutating func move(newAddress: String) {
        self.address = newAddress
    }
    /*func toString() -> String {
        return "Name: \(self.firstName) \(self.lastName), Date: \(self.expirationDate), Address: \(self.address), Organ Donor: \(self.organDonor)"
    }
    */
    var organDonor: Bool
    var under21: Bool
    var liscenseClass: String
    
    mutating func changeOrganStatus(newStatus: Bool) {
        self.organDonor = newStatus
    }
    
    var id: String
}

/**
 Now that you have implemented a basic protocol, you can see how protocols add
 structure to your code and make it easier to keep track of models.
 
 Let's create an instance of your object and test the functionality.
 */

// [3] Test out the functionality of your newly created struct

// Provide values for your properties as arguments to remove error messages
//
// If there are no error messages, you might want to take a second look
// at your implementation for [2]
var myDriverLiscense: DriversLicense = DriversLicense(firstName: "Alec", lastName: "Hance", expirationDate: "1-1-30", address: "North Pole", organDonor: true, under21: true, liscenseClass: "c", id: "1110")

// print your license information on the line below.
print(myDriverLiscense.toString())
// now, change your address and print toString again.
myDriverLiscense.move(newAddress: "South Pole")
myDriverLiscense.changeOrganStatus(newStatus: false)
print(myDriverLiscense.toString())

// [4] Create a Buzzcard struct which conforms to PersonalID and Hashable

/**
 Next, you will create another personal id, Buzzcard, that conforms to our
 protocol. Follow the same 3 steps as in DriversLicense.
 
 After that, make Buzzcard hashable.
 */

// ADD YOUR PROTOCOL STARTING BELOW THIS LINE
struct Buzzcard: PersonalID, Hashable {
    var firstName: String
    var lastName: String
    var expirationDate: String
    var address: String
    
    mutating func move(newAddress: String) {
        self.address = newAddress
    }
    func toString() -> String {
        return "Name: \(self.firstName) \(self.lastName), Date: \(self.expirationDate), Address: \(self.address)"
    }
    var gtid: Int
    var isStudent: Bool
    var color: String
    
    mutating func graduate() {
        self.isStudent = false
    }
}

// [5] Create an extension of PersonalID which consolidates redundant code.

/**
 Now that you have implemented protocols in multiple structs, you should have
 noticed some redundancies in your code, such as the "move" function.
 If you predict that a function will have identical implementations in multiple
 structs/classes, you can provide a default implementation using a protocol
 EXTENSION.
 
 Copy your code for the move function into the extension shell code below.
 */

extension PersonalID {
    mutating func move(newAddress: String) {
        self.address = newAddress
    }
}

// [6] Implement an extension from scratch which adds toString() functionality

/**
 Once you have implemented a function in a protocol extension, you can choose
 to delete the redundant function in your structs/classes, or leave it if you
 would like a more specific implementation. Below, add a protocol extension
 for the "toString" method.
 */

// your code here
extension PersonalID {
    func toString() -> String {
        return "Name: \(self.firstName) \(self.lastName), Date: \(self.expirationDate), Address: \(self.address)"
    }
}

print(myDriverLiscense.toString())
