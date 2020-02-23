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
    var number: Int!
    
    let ud = UserDefaults()
    
    var toDoArrayTitle: [String] = []
    var toDoArrayContent: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //cellから飛んできた時に、保存されているものを表示するよ。
        if number == nil {
            
        }else{
            textField.text = toDoArrayTitle[number]
            textView.text = toDoArrayContent[number]
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        toDoArrayTitle.append(textField.text!)
        toDoArrayContent.append(textView.text!)
        
        ud.set(toDoArrayTitle, forKey: "todoTitle")
        ud.set(toDoArrayContent, forKey: "toDoContent")
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func back() {
        self .dismiss(animated: true, completion: nil)
    }
    

    

}
