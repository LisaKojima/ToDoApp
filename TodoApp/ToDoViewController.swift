//
//  ToDoViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 2020/01/26.
//  Copyright © 2020 Kojima Lisa. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    
    //storyBoardで扱うTableViewを宣言
    @IBOutlet var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイトルをセット
        self.navigationController?.title = "TODO"
        self.navigationController?.navigationBar.barTintColor = .black

    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

