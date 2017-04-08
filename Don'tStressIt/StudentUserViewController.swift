//
//  studentUserViewController.swift
//  Don'tStressIt
//
//  Created by Andy Wong on 4/8/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import UIKit

class StudentUserViewController: UIViewController{
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var confirmTextField: UITextField!
	override func viewDidLoad() {

	}
	
	override func viewDidLayoutSubviews() {
//		//Top TextFieldLine
//		let topLayer = CALayer()
		let borderWidth = CGFloat(0.3)
//		topLayer.borderColor = UIColor.gray.cgColor
//		topLayer.frame = CGRect(x:0, y:0, width: nameTextField.frame.width, height: 1)
//		topLayer.borderWidth = borderWidth
//		nameTextField.layer.addSublayer(topLayer)
//		nameTextField.layer.masksToBounds = true
		
		
		//Bottom TextFieldLine
		let bottomLayer = CALayer()
		bottomLayer.borderColor = UIColor.gray.cgColor
		bottomLayer.frame = CGRect(x:0, y: nameTextField.frame.height-1.0, width: nameTextField.frame.width, height: 1)
		bottomLayer.borderWidth = borderWidth
		
		nameTextField.layer.addSublayer(bottomLayer)
		nameTextField.layer.masksToBounds = true
		
		usernameTextField.layer.addSublayer(bottomLayer)
		usernameTextField.layer.masksToBounds = true
		
	}
}
