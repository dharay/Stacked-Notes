//
//  CoreDataUtility.swift
//  StackedNotes
//
//  Created by Dharay Mistry on 9/6/17.
//  Copyright © 2017 Dharay Mistry. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var notesEntityArray = [NoteEntity]()
let context = (UIApplication.shared.delegate as! AppDelegate).getContext()

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
    try! context.save()

}

func changeNoteStatusInCoreData(ofNote noteText :String , toStatus status : String) {
    
    let note = searchNoteEntityByText(text: noteText)
    context.delete(note)
    note.noteStatus = status
    let note2Insert = NSEntityDescription.insertNewObject(forEntityName: "NoteEntity", into: context) as! NoteEntity
    note2Insert.noteStatus = status
    note2Insert.noteText = note.noteText

    try! context.save()

}

func editNoteInCoreData(oldNote:String , newNote :String){

    let note = searchNoteEntityByText(text: oldNote)
    context.delete(note)
    note.noteText = newNote
    let note2Insert = NSEntityDescription.insertNewObject(forEntityName: "NoteEntity", into: context) as! NoteEntity
    note2Insert.noteStatus = note.noteStatus
    note2Insert.noteText = newNote
    
    try! context.save()

}

func deleteNoteInCoreData(noteText :String){
    
    let note = searchNoteEntityByText(text: noteText)
    context.delete(note)
    notesEntityArray.remove(at: notesEntityArray.index(of: note)!)
    try! context.save()
    
}

func searchNoteEntityByText(text:String) -> NoteEntity{

    var note = NoteEntity()
    for i in notesEntityArray{
        if i.noteText == text{note = i;break}
    }
    return note
}

