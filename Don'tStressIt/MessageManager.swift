//
//  MessageManager.swift
//  Don'tStressIt
//
//  Created by Andy Wong on 4/8/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

func connectClientWithCompletion(completion: @escaping (Bool, NSError?) -> Void) {
    if (client != nil) {
        logout()
    }
    requestTokenWithCompletion { succeeded, token in
        if let token = token, succeeded {
            self.initializeClientWithToken(token:token)
            completion(succeeded, nil)
        }
        else {
            let error = self.errorWithDescription(description: "Could not get access token", code:301)
            completion(succeeded, error)
        }
    }
}

func initializeClientWithToken(token:String){
    let accessManager  = TwilioAccessManager(token:token, delegate:self)
    client = TwilioChatClient.init(token:token, properties:nil, delegate:self)
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    self.connected = true
}

func requestTokenWithCompletion(complettion:@escaping (Bool, String?) -> Void) {
    if let device = UIDevice.current.identifierForVendor?.uuidString{
        TokenRequesdtHandler.fetchToken(params: )
    }
}
