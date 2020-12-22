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
    static var networkingQequestQ = SerialDispatchQueueScheduler(internalSerialQueueName: "sim.GitHubApiList.networkingQequestQ")
}
