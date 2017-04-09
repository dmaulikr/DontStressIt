//
//  LoginViewController.swift
//  DoNotStressIt
//
//  Created by Andy Wong on 4/9/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class LoginViewController:UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	override func viewDidLoad() {
		//Top TextFieldLine
		let topLayer = CALayer()
		let borderWidth = CGFloat(1.3)
		topLayer.borderColor = UIColor.gray.cgColor
		topLayer.frame = CGRect(x:0, y:0, width: emailTextField.frame.width, height: 1)
		topLayer.borderWidth = borderWidth
		emailTextField.layer.addSublayer(topLayer)
		emailTextField.layer.masksToBounds = true
		
		//Botton Line Field Line
		configureTextField(x: 0, y: emailTextField.frame.height-1, width: emailTextField.frame.width, height: 1, textField: emailTextField)
		configureTextField(x: 0, y: passwordTextField.frame.height-1, width: passwordTextField.frame.width , height: 1, textField: passwordTextField)
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
	@IBAction func loginClick(_ sender: Any) {
		loginUser()
	}
	
	func alert(title:String?, message: String?, option: String? ){
		let alertController = UIAlertController(title: title ?? "Error!", message: message, preferredStyle: .alert) //Alert function for use within class
		alertController.addAction(UIAlertAction(title: option ?? "OK" , style: .cancel, handler:nil))
		present(alertController,animated: true, completion:nil)
		
	}
	
	func loginUser(){
		if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
			self.alert(title: "Error", message: "Please enter username and password", option: "OK")
		} else {
			FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
				if error != nil{
					self.alert(title: "Error!", message: "Username or password invalid", option: "Try Again")
				} else {
					//self.alert(title: "Success!", message: "Account Logged IN", option: "Get Learnin'")
//					let storyboard = UIStoryboard(name: "Main", bundle: nil)
//					let vc = storyboard.instantiateViewController(withIdentifier: "ChatListViewController") as! ChatListViewController
//					navigationController?.pushViewController(vc,animated: true)

				}
			}
		}
	}
	
}
