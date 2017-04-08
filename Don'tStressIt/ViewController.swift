//
//  ViewController.swift
//  Don'tStressIt
//
//  Created by Andy Wong on 4/8/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class UserSelectViewController: UIViewController {
    
    @IBOutlet weak var studentUser: UIButton!
    @IBOutlet weak var tutorUser: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentUser.layer.cornerRadius = 10
        tutorUser.layer.cornerRadius = 10
    }
    
    @IBAction func studentButtonClick(_ sender: Any) {
        
    }

    @IBAction func tutorButtonClick(_ sender: Any) {
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

