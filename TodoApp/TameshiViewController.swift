//
//  TameshiViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 3/15/2 R.
//  Copyright © 2 Reiwa Kojima Lisa. All rights reserved.
//

import UIKit

class TameshiViewController: UIViewController {
    
    //テキストフィールドの設定
    @IBOutlet weak var ToDoTextField : UITextField!
    
    var ToDo: [String] = []
    var ToDoDate: [Date] = []
    
    //UITextfieldに紐づいてる
    @IBOutlet weak var dateField: UITextField!

    //UIDatePickerを定義するための変数
    var datePicker: UIDatePicker = UIDatePicker()
    
    //追加ボタンの設定
    @IBAction func ToDoOKButton(_ sender: Any) {
        //変数に入力内容を入れる
        if UserDefaults.standard.object (forKey: "ToDolist") != nil {
            ToDo = UserDefaults.standard.object (forKey: "ToDolist") as! [String]
        }
        if UserDefaults.standard.object (forKey: "ToDoDate") != nil {
            ToDoDate = UserDefaults.standard.object (forKey: "ToDoDate") as! [Date]
        }
        ToDo.append(ToDoTextField.text!)
        //変数の中身をUDに追加
        UserDefaults.standard.set(ToDo, forKey: "ToDolist")
        UserDefaults.standard.set(ToDoDate, forKey: "ToDoDate")
        //ボタンを押された時の動作
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateField.inputView = datePicker

        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //追加ボタンを押したらフィールドを空にする
        ToDoTextField.text = ""
        if UserDefaults.standard.object (forKey: "ToDolist") != nil {
            ToDo = UserDefaults.standard.object (forKey: "ToDolist") as! [String]
        }
        
    }
    
    @objc func done() {
        dateField.endEditing(true)

        // 日付のフォーマット
        let formatter = DateFormatter()

        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy年MM月dd日"

        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        dateField.text = "\(formatter.string(from: datePicker.date))"
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

