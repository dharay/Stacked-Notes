//
//  NoteEntity+CoreDataProperties.swift
//  server
//
//  Created by Dharay Mistry on 9/26/17.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var person: String?
    @NSManaged public var noteText: String?
    @NSManaged public var noteStatus: String?

}
