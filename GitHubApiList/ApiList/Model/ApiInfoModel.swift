//
//  ApiInfoModel.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import Foundation
import RealmSwift
import SwiftyJSON


/// 用于持久化的 Model
class ApiInfoModel: Object {
    
    /// 主键，API 对应的 Key值
    @objc dynamic var apiName: String = ""
    
    /// API 对应的 URL
    @objc dynamic var apiURL: String = ""
    
    override static func primaryKey() -> String? {
        "apiName"
    }
    
    convenience init(apiName: String, apiURL: String) {
        self.init()
        self.apiName = apiName
        self.apiURL = apiURL
    }
    
}

extension ApiInfoModel {
    
    
    /// 异步写入 Api 信息
    /// - Parameter json: 接口返回的 JSON 数据
    class func writeApiInfo(json: JSON) {
        
        DispatchQueue.realmWirteQ.async {
            
            
            let apiInfos = json.dictionaryValue.map { (value) -> ApiInfoModel in
                ApiInfoModel(apiName: value.key, apiURL: value.value.stringValue)
            }
            
            if let realm = try? Realm(queue: .realmWirteQ) {
                
                try? realm.write {
                    realm.add(apiInfos, update: .all)
                }
                
            }

            
        }
        
        
        
    }
    
    
    /// 获取数据库的 API 信息
    /// - Returns: 数据库中的 API 信息
    class func getApiInfos() -> Results<ApiInfoModel>? {
        
        if let realm = try? Realm() {
            
            realm.refresh()
            return realm.objects(ApiInfoModel.self).sorted(byKeyPath: "apiName")
            
        }
        
        return nil
        
    }
    
    class func clearData() {
        
        if let realm = try? Realm() {
            
            realm.refresh()
            
            try? realm.write {
                realm.delete(realm.objects(ApiInfoModel.self))
            }
            
        }
        
    }
    
}
