//
//  studentSignupViewController.swift
//  DoNotStressIt
//
//  Created by Andy Wong on 4/9/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class StudentSignupViewController:UIViewController {
	
	var allUsers:[String] = []
	var rootRef = FIRDatabase.database().reference(withPath: "Conversation/Users")
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var confirmTextField: UITextField!
	
	@IBAction func signupClick(_ sender: Any) {
		signUpUser()
		addUID()
	}
	
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
	
	func addUID(){
		let tempRef = rootRef.childByAutoId();
		rootRef = rootRef.child(tempRef.key) //Conversation/User/UID
		
	}
	
	func uniqueUsername (username: String? , allUser: Array<String>) -> Bool{ //Ensures that use enters a uniquie username
		for eachuser in allUsers{
			if username == eachuser{
				return false
			}
		}
		return true
	}
	
	func alert(title:String?, message: String?, option: String? ){
		let alertController = UIAlertController(title: title ?? "Error!", message: message, preferredStyle: .alert) //Alert function for use within class
		alertController.addAction(UIAlertAction(title: option ?? "OK" , style: .cancel, handler:nil))
			present(alertController,animated: true, completion:nil)
		
	}
	
	
	func currentUsers() {
		let usersRef = FIRDatabase.database().reference().child("Users")
		usersRef.observeSingleEvent(of: .value, with: {
			(snapshot: FIRDataSnapshot) in
			for user in snapshot.children {
				let users: String = (user as AnyObject).childSnapshot(forPath: "displayName").value as! String
				self.allUsers.append(users)
			}
		})
	}
	
	
	func signUpUser(){
		if self.emailTextField.text!.isEmpty || self.usernameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty || self.confirmTextField.text!.isEmpty || self.usernameTextField.text!.isEmpty
		{
			self.alert(title: "Error!", message: "Please fill in all the fields!", option: "OK")
		}
		else
		{
			if uniqueUsername(username: self.usernameTextField.text!, allUser: allUsers)
			{
				FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { user,error in
					if self.confirmTextField.text! == self.passwordTextField.text!  && self.passwordTextField.text!.characters.count >= 6
					{
						if error != nil || self.nameTextField.text!.characters.count == 0
						{
							print (error!)
							self.alert(title: "Error!", message: "Invalid e-mail or password! ", option: "Try Again")
						}
						else
						{
							self.alert(title: "Success", message: "Account Created", option: "OK")
							
							//Add user info into FirDatabase
							let username = self.usernameTextField.text!
							let email = self.emailTextField.text!
							
							FIRDatabase.database().reference(withPath: "Users/\(FIRAuth.auth()!.currentUser!.uid)").updateChildValues(["uid": "Student\(FIRAuth.auth()!.currentUser!.uid)", "displayName": username, "Email": email])
						}
					}
					else
					{
						self.alert(title: "Error!", message: "Password is less than six cgaracters or does not match", option: "Try Agian!")
					}
				}
			}
			else
			{
					self.alert(title: "Error", message: "Username Taken!", option: "Choose Another Username")
			}
		}

	}
	
}

