//
//  ChatListViewController.swift
//  
//
//  Created by Andy Wong on 4/9/17.
//
//

import Foundation
import UIKit
import Firebase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController{
	
	var message = [JSQMessage]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
}
