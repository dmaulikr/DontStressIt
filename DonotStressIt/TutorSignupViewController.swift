//
//  tutorSignupViewController.swift
//  DoNotStressIt
//
//  Created by Andy Wong on 4/9/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import UIKit

class TutorSignuoVuewController:UIViewController{
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var confirmTextField: UITextField!
	
	
	override func viewDidLoad() {
		//Top TextFieldLine
		let topLayer = CALayer()
		let borderWidth = CGFloat(1.3)
		topLayer.borderColor = UIColor.gray.cgColor
		topLayer.frame = CGRect(x:0, y:0, width: emailTextField.frame.width, height: 1)
		topLayer.borderWidth = borderWidth
		emailTextField.layer.addSublayer(topLayer)
		emailTextField.layer.masksToBounds = true
		
		
		//Bottom TextFieldLines
		configureTextField (x: 0, y: emailTextField.frame.height-1, width: emailTextField.frame.width, height: 1.0, textField: emailTextField)
		configureTextField (x: 0, y: nameTextField.frame.height-1, width: nameTextField.frame.width, height: 1.0, textField: nameTextField)
		configureTextField (x: 0, y: usernameTextField.frame.height-1, width: usernameTextField.frame.width, height: 1.0, textField: usernameTextField)
		configureTextField (x: 0, y: passwordTextField.frame.height-1, width: passwordTextField.frame.width, height: 1.0, textField: passwordTextField)
		configureTextField (x: 0, y: confirmTextField.frame.height-1, width: confirmTextField.frame.width, height: 1.0, textField: confirmTextField)
		
	}
	
	func configureTextField (x:CGFloat, y:CGFloat ,width:CGFloat, height:CGFloat, textField:UITextField){
		let bottomLayer = CALayer()
		let borderWidth = CGFloat(1.3)
		bottomLayer.borderColor = UIColor.gray.cgColor
		bottomLayer.frame = CGRect(x:x, y: y, width: width, height: height)
		textField.borderStyle = UITextBorderStyle.none
		bottomLayer.borderWidth = borderWidth
		textField.layer.addSublayer(bottomLayer)
		textField.layer.masksToBounds = true
	}
}
