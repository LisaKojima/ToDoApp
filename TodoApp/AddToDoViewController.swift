//
//  AddToDoViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 2020/02/09.
//  Copyright © 2020 Kojima Lisa. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    
    let ud = UserDefaults()
    
    var toDoArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        toDoArray.append(textField.text!)
        toDoArray.append(textView.text!)
        ud.set(toDoArray, forKey: "todo")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back() {
        self .dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
