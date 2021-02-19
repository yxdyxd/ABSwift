//
//  ViewController.swift
//  ABSwift
//
//  Created by apple on 2021/2/7.
//

import UIKit

class ViewController: UIViewController {

    var aa = 1
    var bb = 2
    var ab = "qw"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        
        print(aa, bb)
        
        print(self.getString(aaa: "er"))
    }

    func getString(aaa: String) -> String {
        let ccc = ab+aaa
        return ccc
    }

}

