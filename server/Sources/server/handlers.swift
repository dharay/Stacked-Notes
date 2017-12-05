//
//  handlers.swift
//  server
//
//  Created by Dharay Mistry on 9/28/17.
//
//

import Kitura
import Foundation
import CoreData

func helloHandler(request:RouterRequest,response:RouterResponse,next: ()->Void) -> Void {
    
    do{
        
        
        response.status(.OK).send("hello world")
        
        
        next()
    }
}

func saveNote(request:RouterRequest,response:RouterResponse,next: ()->Void) -> Void {
    guard let note = request.parameters["note"] else {
       
        return
    }
    guard let status = request.parameters["status"] else {
        
        return
    }
   
        coreData.storeNoteToCoreData(noteText: note, status: status)
        

        response.status(.OK).send("")
  
    next()
}

func fetchHandler(request:RouterRequest,response:RouterResponse,next: ()->Void) -> Void {
    
    do{
        print("fetch")
        response.status(.OK).send("coreData.notesEasfafadf")
        
        
        next()
    }
}
func saveAllHandler(request:RouterRequest,response:RouterResponse,next: ()->Void) -> Void {
    
    do{
        var data = Data()
        let _ = try! request.read(into: &data)
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        print(json)
        response.status(.OK).send("coreData.notesEntityArray[0].noteText!aAa")
        print("calleds")
        
        next()
    }
}
func fetchAllHandler(request:RouterRequest,response:RouterResponse,next: ()->Void) -> Void {
    
    do{
        
        response.status(.OK).send("coreData.notesEntityArray[0].noteText!")
        print("calledf")
        
        next()
    }
}

