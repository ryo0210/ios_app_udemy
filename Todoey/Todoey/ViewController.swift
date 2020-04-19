//
//  ViewController.swift
//  Todoey
//
//  Created by ryo on 2020/04/18.
//  Copyright © 2020 ryo. All rights reserved.
//

import UIKit

// 名前変更ができない泣
class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggs", "Destory Demogorgon"]
    
    // keyとvalueをアプリの起動時に永続的に保存するデフォルトのデータベース。
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  defaults.arrayが空ならアプリがクラッシュするのでif letを使う。文字列の配列としてキャストする。
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
    }
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    // MARK - TableView Delegate Methods
    
    // どの行が選択されたかを検出するデリゲートメソッド(didSelectRowAt indexPath)をテーブルに追加
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // tableView.cellForRowで特定のindexPathにあるcellへの参照を取得する。
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // cellを選択した時に、灰色になった後すぐ元の表示にもどる。
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Adds new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //addButtonPressed内で使えるローカル変数を作成する。
        var textField = UITextField()
        
        // アラートの構成。
        let alert = UIAlertController(title: "新しいタスクを追加", message: "", preferredStyle: .alert)
        // アラートの選択ボタン
        let action = UIAlertAction(title: "追加", style: .default) { (action) in
            // ユーザーがUIAlertの"追加"ボタンをクリックした後の処理。
            
            // textField.textが空なら"新しいタスク"という名前で追加する。
            // itemArray.append(textField.text ?? "新しいタスク")
            
            //クロージャの中にいるので、itemArrayが存在する場所
            //(現在の場所でコンパイラに明示的に指示するために「self」を指定する必要がある。
            self.itemArray.append(textField.text!)
            
            // forKeyPathはUserDefaults内でこの配列を識別するためのもの。
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            // tableViewの行とセクションが再読み込みされる。
            self.tableView.reloadData()
        }
        // このクロージャーはTextFieldがalertに追加された後にのみトリガーされる。
        alert.addTextField { (aletTextField) in
            aletTextField.placeholder = "新しいタスクを作る。"
            // aletTextFieldはalert.addTextFieldのクロージャーの内部でしか使えないので、
            // addButtonPressed全体で使えるように拡張する。
            textField = aletTextField
        }
        
        alert.addAction(action)
        
        // アラートを表示する。第一引数は表示するアラート。
        present(alert, animated: true, completion: nil)
    }
    
}

// tableViewのAccessoryで、cellを選択したとき別の場所に移動させるか、詳細を表示するかを選択できる。
