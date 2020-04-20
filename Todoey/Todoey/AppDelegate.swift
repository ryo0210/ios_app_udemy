//
//  AppDelegate.swift
//  Todoey
//
//  Created by ryo on 2020/04/18.
//  Copyright © 2020 ryo. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // アプリが読み込まれた時に呼び出される場所。
        return true
    }

//    func applicationWillResignActive(_ application: UIApplication) {
//        // アプリケーションがアクティブ状態から非アクティブ状態に移行しようとしているときに送信されます。これは、特定の種類の一時的な中断（電話の着信やSMSメッセージなど）や、ユーザがアプリケーションを終了してバックグラウンド状態に移行し始めたときに発生する可能性があります。
//        // この方法を使用して、進行中のタスクを一時停止し、タイマーを無効にし、OpenGL ESのフレームレートをスロットルダウンします。ゲームはこの方法を使って一時停止してください。
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // このメソッドを使用して、共有リソースを解放し、ユーザーデータを保存し、タイマーを無効にし、アプリケーションの状態情報を十分に保存して、後でアプリケーションが終了した場合にアプリケーションを現在の状態に戻すことができます。
//        // アプリケーションがバックグラウンドでの実行をサポートしている場合、このメソッドはユーザが終了したときに applicationWillTerminate: の代わりに呼ばれます。
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // バックグラウンドから非アクティブ状態への移行の一部として呼び出されます。ここでは、バックグラウンドに入るときに行った変更の多くを元に戻すことができます。
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // アプリケーションがアクティブでない間に一時停止していた（またはまだ起動していない）タスクを再起動します。アプリケーションが以前にバックグラウンドにあった場合は、オプションでユーザー インターフェイスをリフレッシュします。
//    }

    func applicationWillTerminate(_ application: UIApplication) {
        // アプリケーションが終了しようとしているときに呼び出されます。必要に応じてデータを保存します。applicationDidEnterBackground: も参照してください。
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    // lazy: 必要な時、つまり使用しようとした時に値がロードされる。必要な時だけメモリを使用するように。
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
