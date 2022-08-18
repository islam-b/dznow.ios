//
//  KeychainUtils.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 18/8/2022.
//

import Foundation


class KeychainUtils {
    
    
    private let BASE_TAG = "com.islmb.dznow"
    private static var _instance: KeychainUtils? = nil
    
    private init() {}
    
    public func store(key:String, value: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: "\(BASE_TAG).\(key)",
                                       kSecValueData as String: value.data(using: .utf8) ]
        let status = SecItemAdd(query as CFDictionary, nil)
        if (status == errSecSuccess) {
            return true
        }
        print("Data not stored")
        return false
    
    }
    
    public func retreive(key:String, defaultValue:String? = nil) -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: "\(BASE_TAG).\(key)",
                                       kSecReturnData as String: true]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        if (status == errSecSuccess) {
            let value = String(decoding: (item as! Data), as: UTF8.self)
            return value
        }
        return defaultValue
    }
    
    static func instance() -> KeychainUtils {
        if (_instance == nil) {
            _instance = KeychainUtils()
        }
        return _instance!
    }
    
}
