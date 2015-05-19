//
//  ViewController.swift
//  coredata_sample
//
//  Created by akinroi nakajima on 5/19/15.
//  Copyright (c) 2015 akinroi nakajima. All rights reserved.
//

import UIKit

import CoreData




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ナビバーの右上ボタンを用意
    var addBtn: UIBarButtonItem!
    
    // テーブルを用意
    var piyo: UITableView!
    
    // テーブルに表示するアイテムの配列を用意
    var memos: [NSString] = []
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Home"
        
        // addBtnを設置
        addBtn = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = addBtn
        
        // 画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        // テーブルを用意して表示
        piyo = UITableView(frame: CGRectMake(0, 0, width, height))
        piyo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "data")
        piyo.dataSource = self
        piyo.delegate = self
        self.view.addSubview(piyo)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    // viewDidLoadは最初の一回しか呼ばれないので、viewWillAppearを使うよ
    override func viewWillAppear(animated: Bool) {
        
        // CoreDataからデータを読み込んで配列memosに格納する
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoRequest: NSFetchRequest = NSFetchRequest(entityName: "ToDoStore")
        // 並び順をdateの、昇順としてみる
        toDoRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        toDoRequest.returnsObjectsAsFaults = false
        var results = toDoContext.executeFetchRequest(toDoRequest, error: nil) as [ToDoStore]!
        memos = []
        for data in results {
            memos.append(data.memo)
        }
        
        // テーブル情報を更新する
        self.piyo.reloadData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // addBtnをタップしたときのアクション
    func onClick() {
        let second = EditViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    // セルの行数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    // セルの値を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("data", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = memos[indexPath.row]
        
        return cell
    }
    
    
    

}

