//
//  ApiRequestLog.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import Foundation
import RealmSwift

/// 用于持久化的 Model
class ApiRequestLog: Object {
    
    /// 主键
    // swiftlint:disable:next identifier_name
    @objc dynamic var id: String = UUID().uuidString
    
    /// API 对应的 URL
    @objc dynamic var url: String = ""
    
    /// API 请求时间
    @objc dynamic var requestTime = Date()
    
    /// API 请求方式
    @objc dynamic var method: String = "GET"
    
    override static func primaryKey() -> String? {
        "id"
    }
    
    convenience init(url: String, requestTime: Date, method: String) {
        self.init()
        self.url = url
        self.requestTime = requestTime
        self.method = method
    }
    
    
}

extension ApiRequestLog {
    
    
    
    /// 添加请求记录
    /// - Parameters:
    ///   - url: url
    ///   - requestTime: 请求时间
    ///   - method: 请求方式
    class func addQeuestRecode(url: String, requestTime: Date, method: String) {
        
        DispatchQueue.realmWirteQ.async {
            
            let model = ApiRequestLog(url: url, requestTime: requestTime, method: method)
            
            let realm = try? Realm(queue: .realmWirteQ)
            
            try? realm?.write {
                realm?.add(model)
            }
            
        }
        
    }
    
    class func getQeuestRecord() -> Results<ApiRequestLog>? {
        
        if let realm = try? Realm() {
            
            realm.refresh()
            return realm.objects(ApiRequestLog.self).sorted(byKeyPath: "requestTime")
            
        }
        
        return nil
        
    }
    
    /// 清除数据
    class func clearData() {
        
        if let realm = try? Realm() {
            
            realm.refresh()
            
            try? realm.write {
                realm.delete(realm.objects(ApiRequestLog.self))
            }
            
        }
        
    }
    
}
