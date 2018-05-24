import Kitura
import Foundation
//import CoreData


//let coreData = CoreData()


// Create a new router which will control URL Mappings
let router = Router()

//coreData.fetchNotesFromCoreData()
//coreData.deleteAll()

router.get("/hello", handler: helloHandler)
router.get("/save/:note/:status", handler: saveNote)
router.get("/fetch", handler: fetchHandler)
router.post("/saveAll", handler: saveAllHandler)
router.get("/fetchAll", handler: fetchAllHandler)

Kitura.addHTTPServer(onPort: 8090, with: router)
print("server started")
Kitura.run()

