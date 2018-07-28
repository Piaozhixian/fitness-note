//
//  ViewController.swift
//  fitness-note
//
//  Created by Zhixian Piao on 2018/7/28.
//  Copyright © 2018年 Zhixian Piao. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    @IBOutlet weak var commitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func commitBtnClicked(_ sender: Any) {
        let historyFilePath = NSHomeDirectory() + "/Documents/history.json"
        
        if !is_file_exist(filePath: historyFilePath) {
            do {
                try makeFile(filePath: historyFilePath)
                print("Success: Made history file")
            } catch {
                print("Error:Make file failed")
            }
        }
    }
    
    private func is_file_exist (filePath:String)->Bool {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: filePath)
    }
    
    private func makeFile (filePath:String) throws {
        let fileManager = FileManager.default
        fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    }
}

