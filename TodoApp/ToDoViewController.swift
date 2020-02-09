//
//  ToDoViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 2020/01/26.
//  Copyright © 2020 Kojima Lisa. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //storyBoardで扱うTableViewを宣言
    @IBOutlet var table : UITableView!
    
    var toDoArray: [[String]] = [["hoge", "hoge"]]
    
    let ud = UserDefaults()
    
    override func viewWillAppear(_ animated: Bool) {
        if ud.array(forKey: "todo") as? [String] != nil {
            toDoArray.append(ud.array(forKey: "todo") as! [String])
        }
        
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    
        //タイトルをセット
        self.navigationController?.title = "TODO"
        self.navigationController?.navigationBar.barTintColor = .black

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toDoArray[indexPath.row][0]
        return cell
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }

            // trueで複数選択、falseで単一選択
                   tableView.allowsMultipleSelection = true

                   tableView.tableFooterView = UIView(frame: .zero)

                   self.view.addSubview(tableView)
               }

               // セルが選択された時に呼び出される
               func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                   let cell = tableView.cellForRow(at:indexPath)

                   // チェックマークを入れる
                   cell?.accessoryType = .checkmark
               }

               // セルの選択が外れた時に呼び出される
               func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
                   let cell = tableView.cellForRow(at:indexPath)

                   // チェックマークを外す
                   cell?.accessoryType = .none
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


