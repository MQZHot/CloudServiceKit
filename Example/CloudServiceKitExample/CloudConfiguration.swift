//
//  CloudConfiguration.swift
//  CloudServiceKitExample
//
//  Created by alexiscn on 2021/9/28.
//

import Foundation

struct CloudConfiguration {
    
    let appId: String
    
    let appSecret: String
    
    let redirectUrl: String
}

extension CloudConfiguration {
    
    static var aliyun: CloudConfiguration? {
        // fulfill your aliyundrive app info
        return CloudConfiguration.init(appId: "a9baaac5f1664196a3c14d8e96c7a677", appSecret: "1a1f43e3d75b4742bdb781bdb0fa491c", redirectUrl: "oauth-swift://oauth-callback/aliyun")
    }
    
    static var baidu: CloudConfiguration? {
        // fulfill your baidu app info
        return nil
    }
    
    static var box: CloudConfiguration? {
        return CloudConfiguration.init(appId: "o7dho6zacqbbxzt186egybs5upeigxuv", appSecret: "q388a30pkj0815u", redirectUrl: "oauth-swift://")
    }
    
    static var dropbox: CloudConfiguration? {
        return CloudConfiguration.init(appId: "9942lzp3cbj03si", appSecret: "q388a30pkj0815u", redirectUrl: "oauth-swift://oauth-callback/dropbox")
    }
    
    static var googleDrive: CloudConfiguration? {
        return CloudConfiguration.init(appId: "49236675139-tqegapo7l5rjuppbsr5ov3ci73e8suv4.apps.googleusercontent.com", appSecret: "", redirectUrl: "com.soso.music.wave://")
    }
    
    static var oneDrive: CloudConfiguration? {
        return nil
    }
    
    static var pCloud: CloudConfiguration? {
        return nil
    }
}
