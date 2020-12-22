//
//  ApiInfoModel.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import Foundation
import RealmSwift


/// 用于持久化的 Model
class ApiInfoModel: Object {
    
    
    /// 主键，同时用于排序
    @objc dynamic var index: Int = 0
    
    /// API 对应的 Key值
    @objc dynamic var apiName: String = ""
    
    /// API 对应的 URL
    @objc dynamic var apiURL: String = ""
    
    override static func primaryKey() -> String? {
        "index"
    }
    
}
