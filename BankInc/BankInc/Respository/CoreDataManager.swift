import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        // Attempt to locate the data model file
        guard let modelURL = Bundle.main.url(forResource: "BankModel", withExtension: "xcdatamodeld") else {
            fatalError("Failed to locate data model file.")
        }

        // Load the managed object model from the model URL
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Failed to load data model.")
        }

        // Initialize the persistent container with the specified name and managed object model
        container = NSPersistentContainer(name: "BankModel", managedObjectModel: managedObjectModel)
    }
}
