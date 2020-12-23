//
//  DispatchQueueDefines.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import Foundation
import RxSwift

extension SerialDispatchQueueScheduler {
    
    
    /// 网络请求使用的队列
    static var networkingRequestQ = SerialDispatchQueueScheduler(internalSerialQueueName: "sim.GitHubApiList.networkingRequestQ")
}


extension DispatchQueue {
    static var realmWirteQ = DispatchQueue(label: "sim.GitHubApiList.realmWirteQ")
}
