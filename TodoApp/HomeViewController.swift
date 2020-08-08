//
//  HomeViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 3/15/2 R.
//  Copyright © 2 Reiwa Kojima Lisa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    var ToDo: [String] = []
    var ToDoDate: [Date] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ToDoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let ToDoDate : UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "ToDoDate", for: indexPath)
        //変数の中身を作る
        ToDoCell.textLabel!.text = ToDo[indexPath.row]
        //戻り値の設定
        return ToDoCell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let _: UserDefaults = UserDefaults.standard
        if UserDefaults.standard.object (forKey: "ToDolist") != nil {
            ToDo = UserDefaults.standard.object (forKey: "ToDolist") as! [String]
        }
        tableview.reloadData()
    }
    
    func tableView(_ tableview: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
           ToDo.remove(at: indexPath.row)
            let indexPath = [indexPath]
            tableview.deleteRows(at: indexPath, with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.removeObject(forKey: "ToDolist")
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
