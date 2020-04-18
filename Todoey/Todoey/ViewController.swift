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
    
    let itemArray = ["Find Mike", "Buy Eggs", "Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        // cellを選択した時に、灰色になった後すぐ元の表示にもどる。
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// tableViewのAccessoryで、cellを選択したとき別の場所に移動させるか、詳細を表示するかを選択できる。
