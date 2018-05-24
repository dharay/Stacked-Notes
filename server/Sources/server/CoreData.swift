//
//  CoreData.swift
//  server
//
//  Created by Dharay Mistry on 9/26/17.
//
//

import Foundation
/*import CoreData

@available(OSX 10.12, *)
class CoreData{
    static var coreData = CoreData()
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
 
    var context : NSManagedObjectContext!
    init() {
        context = persistentContainer.viewContext
    }
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    var notesEntityArray = [NoteEntity]()

    
    enum noteStatus : String {
        case pending = "Pending"
        case complete = "Complete"
        case onGoing = "On Going"
    }
    
    
    func fetchNotesFromCoreData() {
        
        let fetchRequest : NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()
        notesEntityArray = try! context.fetch(fetchRequest)
        
    }
    
    func storeNoteToCoreData(noteText: String,status :String){
        
        //update notesEntitArray seperately
        let note = NSEntityDescription.insertNewObject(forEntityName: "NoteEntity", into: context) as! NoteEntity
        note.noteText = noteText
        note.noteStatus = status
        saveContext()
        
    }
    
    func changeNoteStatusInCoreData(ofNote noteText :String , toStatus status : String) {
        
        let note = searchNoteEntityByText(text: noteText)
        context.delete(note)
        note.noteStatus = status
        let note2Insert = NSEntityDescription.insertNewObject(forEntityName: "NoteEntity", into: context) as! NoteEntity
        note2Insert.noteStatus = status
        note2Insert.noteText = note.noteText
        
        saveContext()
        
    }
    
    func editNoteInCoreData(oldNote:String , newNote :String){
        
        let note = searchNoteEntityByText(text: oldNote)
        context.delete(note)
        note.noteText = newNote
        let note2Insert = NSEntityDescription.insertNewObject(forEntityName: "NoteEntity", into: context) as! NoteEntity
        note2Insert.noteStatus = note.noteStatus
        note2Insert.noteText = newNote
        
        saveContext()
        
    }
    
    func deleteNoteInCoreData(noteText :String){
        
        let note = searchNoteEntityByText(text: noteText)
        context.delete(note)
        notesEntityArray.remove(at: notesEntityArray.index(of: note)!)
        saveContext()
        
    }
    
    func searchNoteEntityByText(text:String) -> NoteEntity{
        
        var note = NoteEntity()
        for i in notesEntityArray{
            if i.noteText == text{note = i;break}
        }
        return note
    }
    
    func deleteAll(){
        notesEntityArray.removeAll()
        saveContext()
        
    }
    

    
    
 }*/
