//
//  ViewController.swift
//  Todoey
//
//  Created by ryo on 2020/04/18.
//  Copyright © 2020 ryo. All rights reserved.
//

import UIKit
import CoreData

// 名前変更ができない泣
class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    // Documentsフォルダへのファイルパスを作成する。ファイルシステムへのインターフェイスを提供するオブジェクト（よく分からん）
    // 共有ファイルマネージャーオブジェクトであるデフォルトのファイルマネージャーを使用します。
    // ディレクトリとドメインマスクが引数。ディレクトリにはドキュメントディレクトリを入れ、
    // ドメインマスクにはそれを探す場所をユーザドメインマスクの引数に入れる。
    // userDomainMaskは、ユーザーのホームディレクトリで、現在のアプリケーションに関する個人的なアイテムを保存する場所。
    // appendingPathComponentで必要なものを呼び出すことができるパスコンポーネントを追加できる。
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    // keyとvalueをアプリの起動時に永続的に保存するデフォルトのデータベース。
    // Stringだけの配列とかなら保存可能だが、今回のようにカスタムしたStringとBoolを組み合わせた配列はUserDefaultsでは保存できない。
    // なので、上のFileManagerを使ってデータを保存している。
    // (defaults.setのvalueの型がFloatならゲームの音量(defaults.set(0.25, forkey: "Volume")、
    // boolならBGMを流すかどうか(defaults.set(true, forkey: "MusicOn")などに使える。)
//    let defaults = UserDefaults.standard
    
    
    // Applicationの代わりにUIApplication.sharedを利用する。これは、シングルトンのアプリケーションインスタンスです。
    // ??? Udemy:265
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let newItem1 = Item()
//        newItem1.title = "Find Mike"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.title = "Buy Eggs"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Destory Demogorgon"
//        itemArray.append(newItem3)
//
        //  defaults.arrayが空ならアプリがクラッシュするのでif letを使う。文字列の配列としてキャストする。
//        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
//            itemArray = items
//        }

        
        //loadItems()
        
    }
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 画面に表示されていないセルは最初のセルを再利用して生成されるので、チェックマークも同期されておかしくなってしまう。
        // let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // 新しいテイブルビューセルとして下部で再初期化される。そして、それが再利用されるのでチェックされたアクセサリが
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        // 上の5行を1行で置き換えている。
        // もし、item.doneがtrueならcell.accessoryTypeを.checkmarkに、そうでないなら.noneにする。
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }

    // MARK - TableView Delegate Methods
    
    // どの行が選択されたかを検出するデリゲートメソッド(didSelectRowAt indexPath)をテーブルに追加
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // tableView.cellForRowで特定のindexPathにあるcellへの参照を取得する。
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
        // 上の5行のコードを1行に置き換えられる。
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        // アラートコントローラーを使って新しいアイテムを追加して時と、私たちはチェックマークをトグルし、
        // アイテムを保存しているアイテムの中にあるので、tableView.reloadData()を削除できる。　？？
        //tableView.reloadData()
        
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
            
            
            let newItem1 = Item(context: self.context)
            
            
            newItem1.title = textField.text!
            newItem1.done = false
            
            // textField.textが空なら"新しいタスク"という名前で追加する。
            // itemArray.append(textField.text ?? "新しいタスク")
            //クロージャの中にいるので、itemArrayが存在する場所
            //(現在の場所でコンパイラに明示的に指示するために「self」を指定する必要がある。
            self.itemArray.append(newItem1)
            
            // forKeyPathはUserDefaults内でこの配列を識別するためのもの。
//            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.saveItems()
            
            // tableViewの行とセクションが再読み込みされる。
            //self.tableView.reloadData()
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
    
    // MARK - Model Manupulation Methods アイテムを保存する関数コード
    
    func saveItems() {
//        let encoder = PropertyListEncoder()
        // カスタムデータベースに書き込み。
        do {
//            let data = try encoder.encode(itemArray)
//            try data.write(to: dataFilePath!)
            try context.save()
        } catch {
            print("=======saveItems=======\(error)")
        }
        self.tableView.reloadData()

    }
    
//    func loadItems() {
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print(error)
//            }
//        }
//    }
}
