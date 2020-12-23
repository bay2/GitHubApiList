//
//  SessionAdapter.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import Foundation
import Alamofire

extension Adapter {
    static var networkInterceptor = Adapter { (request, _, completion) in
        
        let url = request.urlRequest?.url?.absoluteString ?? ""
        let method = request.urlRequest?.method?.rawValue ?? "GET"
        let requestTime = Date()
                
        ApiRequestLog.addQeuestRecode(url: url, requestTime: requestTime, method: method)
        
        completion(.success(request))
        
    }
}
