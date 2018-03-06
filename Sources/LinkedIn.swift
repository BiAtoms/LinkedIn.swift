//
//  LinkedIn.swift
//  LinkedInSwift
//
//  Created by Orkhan Alikhanov on 3/6/18.
//  Copyright © 2018 BiAtoms. All rights reserved.
//

import LinkedInSDK

public typealias LinkedInCallbackClosure = (LinkedInUser?, Error?) -> Void
open class LinkedIn {

    open static var showGoToAppStoreDialog = true
    open static func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        
        return LISDKCallbackHandler.shouldHandle(url) && LISDKCallbackHandler
            .application(app,
                         open: url,
                         sourceApplication: options[.sourceApplication] as? String,
                         annotation: options[.annotation])
    }
    
    open static func login(permissions: [LinkedInPermission] = [.basicProfile, .email], callback: @escaping LinkedInCallbackClosure) {
        let randomStr = UUID().uuidString
        
        
        func didSuccess(state: String?) {
            guard state == randomStr else { fatalError("CSRF attack") }
            fetchUser(callback: callback)
        }
        
        func didFail(error: Error?) {
            callback(nil, error)
        }
        
        
        LISDKSessionManager.createSession(withAuth: permissions.strings,
                                          state: randomStr,
                                          showGoToAppStoreDialog: showGoToAppStoreDialog,
                                          successBlock: didSuccess,
                                          errorBlock: didFail)
    }
    
    /// see https://developer.linkedin.com/docs/fields
    open static var userFields = ["id",
                                  "first-name",
                                  "last-name",
                                  "email-address",
                                  "picture-url"]
    
    open static func fetchUser(callback: @escaping LinkedInCallbackClosure) {
        let url = "https://api.linkedin.com/v1/people/~:(\(userFields.joined(separator: ",")))?format=json"
        LISDKAPIHelper.sharedInstance().getRequest(url, success: { response in
            guard let jsonData = response?.data.data(using: .utf8),
                let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
                let jsonDict = jsonObject as? [String: Any]
                else {
                    callback(nil, nil)
                    return
                }
            
            callback(LinkedInUser(jsonDict: jsonDict), nil)
        }, error: {
            callback(nil, $0)
        })
    }
}
