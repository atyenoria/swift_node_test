import UIKit
import CoreData


class ToDoStore: NSManagedObject {
    
    @NSManaged var memo :String
    @NSManaged var date :NSDate
}