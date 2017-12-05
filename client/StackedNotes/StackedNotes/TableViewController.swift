

import UIKit

class TableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTableData()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction)),
            
        ]
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "save🌐", style: .plain, target: self, action: #selector(saveAction)),
            UIBarButtonItem(title: "fetch🌐", style: .plain, target: self, action: #selector(fetchAction2))
        ]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesEntityArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notesEntityArray[indexPath.row].noteText
        cell.detailTextLabel?.text = notesEntityArray[indexPath.row].noteStatus
        
        var cellColor : UIColor  {
            get {
                switch notesEntityArray[indexPath.row].noteStatus! {
                case noteStatus.pending.rawValue:
                    return UIColor.green
                case noteStatus.complete.rawValue:
                    return UIColor.blue
                case noteStatus.onGoing.rawValue:
                    return UIColor.yellow
                    
                default:
                    return UIColor.white
                }
                
            }
        }
        
        cell.imageView?.image = UIImage(color: cellColor, size: CGSize.init(width: 25, height: 25))
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editController = self.storyboard?.instantiateViewController(withIdentifier: "NoteEditVC") as! AddNoteViewController
        editController.editNoteMode = true
        editController.editText = notesEntityArray[indexPath.row].noteText!
        self.navigationController?.pushViewController(editController, animated: true)
        
    }

    

   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let pendingAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: noteStatus.pending.rawValue, handler:{action, indexpath in
            changeNoteStatusInCoreData(ofNote: notesEntityArray[indexPath.row].noteText!, toStatus: noteStatus.pending.rawValue)
            
            self.reloadTableData()
            
        })
        pendingAction.backgroundColor = UIColor.green;
        
        let onGoingAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: noteStatus.onGoing.rawValue, handler:{action, indexpath in
            changeNoteStatusInCoreData(ofNote: notesEntityArray[indexPath.row].noteText!, toStatus: noteStatus.onGoing.rawValue)
            
            self.reloadTableData()
           
        })
        onGoingAction.backgroundColor = UIColor.yellow;
        
        let completeAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: noteStatus.complete.rawValue, handler:{action, indexpath in
            changeNoteStatusInCoreData(ofNote: notesEntityArray[indexPath.row].noteText!, toStatus: noteStatus.complete.rawValue)
            
            self.reloadTableData()
            
        })
        completeAction.backgroundColor = UIColor.blue;
        
        let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{action, indexpath in
            deleteNoteInCoreData(noteText: notesEntityArray[indexPath.row].noteText!)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        
        return [deleteRowAction, pendingAction, onGoingAction, completeAction];
    }
    
    func reloadTableData(){
    
        fetchNotesFromCoreData()
        notesEntityArray = notesEntityArray.reversed()
        tableView.reloadData()
    }
    @objc func addAction(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "NoteEditVC")
        self.navigationController?.pushViewController(next!, animated: true)
        
    }
    @objc func saveAction(){
        save2server()
        
    }
    @objc func fetchAction2(){
        
        fetchFromServer()
        
    }


}
