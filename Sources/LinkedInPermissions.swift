//
//  LinkedInPermissions.swift
//  LinkedInSwift
//
//  Created by Orkhan Alikhanov on 3/6/18.
//  Copyright © 2018 BiAtoms. All rights reserved.
//

import LinkedInSDK

public enum LinkedInPermission {
    case basicProfile
    case fullProfile
    case email
    case contactInfo
    case share
    
    case companyAdmin
    
    public var rawValue: String {
        switch self {
        case .basicProfile:
            return LISDK_BASIC_PROFILE_PERMISSION
        case .fullProfile:
            return LISDK_FULL_PROFILE_PERMISSION
        case .email:
            return LISDK_EMAILADDRESS_PERMISSION
        case .contactInfo:
            return LISDK_CONTACT_INFO_PERMISSION
        case .share:
            return LISDK_W_SHARE_PERMISSION
        case .companyAdmin:
            return LISDK_RW_COMPANY_ADMIN_PERMISSION
        }
    }
}

public extension Array where Element == LinkedInPermission {
    var strings: [String] {
        return map { $0.rawValue }
    }
    
    var spaceDelimitedAndUrlEncoded: String {
        return NSString(string: strings.joined(separator: " "))
            .addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
    }
}
