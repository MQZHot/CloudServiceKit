//
//  CloudAccountManager.swift
//  CloudServiceKitExample
//
//  Created by alexiscn on 2021/9/29.
//

import Foundation
import KeychainAccess
import CloudServiceKit

class CloudAccount: Codable, Equatable {
    
    static func == (lhs: CloudAccount, rhs: CloudAccount) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    let identifier: String
    
    let username: String
    
    let driveType: CloudDriveType
    
    var oauthToken: String
    
    var refreshToken: String?
    
    init(type: CloudDriveType, username: String, oauthToken: String) {
        self.identifier = UUID().uuidString
        self.driveType = type
        self.username = username
        self.oauthToken = oauthToken
    }
}

class CloudAccountManager {
 
    static let shared = CloudAccountManager()
    
    private let keychain = Keychain(service: "me.shuifeng.CloudServiceKit.CloudAccount")
    
    private(set) var accounts: [CloudAccount] = []
    
    private let key = "accounts"
    
    private init() {
        if let data = try? keychain.getData(key) {
            let items = try? JSONDecoder().decode([CloudAccount].self, from: data)
            accounts = items ?? []
        }
    }
    
    func remove(_ account: CloudAccount) {
        if let index = accounts.firstIndex(of: account) {
            accounts.remove(at: index)
            save()
        }
    }
    
    func upsert(_ account: CloudAccount) {
        if let index = accounts.firstIndex(of: account) {
            accounts[index] = account
        } else {
            accounts.append(account)
        }
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(accounts)
            try keychain.set(data, key: key)
        } catch {
            print(error)
        }
    }
}

extension AliyunDriveServiceProvider {
    /// Get Drive Info
    /// - Parameter completion: Completion block.
    func getDriveInfo(completion: @escaping (Result<String, Error>) -> Void) {
        let url = apiURL.appendingPathComponent("/adrive/v1.0/user/getDriveInfo")
        post(url: url) { response in
            switch response.result {
            case .success(let result):
                if let json = result.json as? [String: Any], let drive_id = json["default_drive_id"] as? String {
                    self.driveId = drive_id
                    completion(.success(drive_id))
                } else {
                    completion(.failure(CloudServiceError.responseDecodeError(result)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
