

import UIKit

class AddNoteViewController: UIViewController , UITextViewDelegate {

    @IBOutlet weak var noteTextBox: UITextView!
    
    var editNoteMode = false
    var editText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveAction))
        noteTextBox.delegate = self
        if editNoteMode{
            noteTextBox.text = editText
            noteTextBox.textColor = UIColor.black
        }
        // Do any additional setup after loading the view.
    }

    @objc func saveAction(){
        if !editNoteMode{
            storeNoteToCoreData(noteText: noteTextBox.text, status: "Pending")
            self.navigationController?.popViewController(animated: true)
        }
        else{
            editNoteInCoreData(oldNote: editText, newNote: noteTextBox.text)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if noteTextBox.text == "Add Note" && editNoteMode == false{
            noteTextBox.text = ""
            noteTextBox.textColor = UIColor.black
        }
    }

}

