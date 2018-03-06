//
//  LinkedInUser.swift
//  LinkedInSwift
//
//  Created by Orkhan Alikhanov on 3/6/18.
//  Copyright © 2018 BiAtoms. All rights reserved.
//

public struct LinkedInUser {
    public var jsonDict: [String: Any]
    
    public init(jsonDict: [String: Any]) {
        self.jsonDict = jsonDict
    }
    
    public subscript(key key: String) -> String? {
        return jsonDict[key] as? String
    }
    
    public subscript(key: String) -> String {
        return self[key: key] ?? ""
    }
    
    public var id: String { return self["id"] }
    public var firstName: String { return self["firstName"] }
    public var lastName: String { return self["lastName"] }
    public var pictureUrl: String { return self["pictureUrl"] }
    public var email: String? { return self[key: "emailAddress"] }
}
