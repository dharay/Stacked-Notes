//
//  Networking.swift
//  StackedNotes
//
//  Created by Dharay Mistry on 9/22/17.
//  Copyright © 2017 Dharay Mistry. All rights reserved.
//

import Foundation
let baseURL = "http://localhost:8090"
var thePerson = "a"
let accounts : [String:String] = ["a":"a","tony":"stank"]

func save2server(){
    fetchNotesFromCoreData()
    let statuses = notesEntityArray.map({$0.noteStatus!})
    let notes  = notesEntityArray.map({$0.noteText!})
    let json: [[String: Any]] = [["noteStatus": statuses,
                               "notes" : notes]]
    print(json)
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
    // create post request
    let url = URL(string: baseURL + "/saveAll")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // insert json data to the request
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let _ = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        
        print("saved2server")
        /**/
    }
    
    task.resume()
    
}

func fetchFromServer(){

    let url = URL(string: baseURL + "/fetchAll")!
    var request = URLRequest(url: url)

    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
        guard let _ = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
        if (responseJSON as? [[[String: String]]]) != nil {
            print("type confirmed")
        }
        print(responseJSON!)
        let temp = responseJSON as! [[[String:Any]]]
        let notes = temp[0]//[[String:String]]
        for note in notes{
            storeNoteToCoreData(noteText: (note["notes"] as! [String])[0], status: (note["noteStatus"] as! [String])[0])
        }
        fetchInProgress = false
        print("fetched from server")
    }
    task.resume()
}

        


