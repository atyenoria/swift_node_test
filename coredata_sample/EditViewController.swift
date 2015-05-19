//
//  EditViewController.swift
//  coredata_sample
//
//  Created by akinroi nakajima on 5/19/15.
//  Copyright (c) 2015 akinroi nakajima. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    
    // TextFieldを用意
    var memoField: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyanColor()
        self.title = "Edit"
        
        
        // text field
        memoField = UITextField(frame: CGRectMake(100, 100, 200, 30))
        memoField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoField)
        
        // write button
        let writeBtn: UIButton = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.backgroundColor = UIColor.magentaColor()
        writeBtn.setTitle("メモを保存", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // CoreDataへの書き込み処理（writeBtnのアクション）
    func writeData() {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoEntity: NSEntityDescription! = NSEntityDescription.entityForName("ToDoStore", inManagedObjectContext: toDoContext)
        var newData = ToDoStore(entity: toDoEntity, insertIntoManagedObjectContext: toDoContext)
        newData.memo = memoField.text
        newData.date = NSDate()
    
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
