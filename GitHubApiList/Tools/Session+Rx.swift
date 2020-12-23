//
//  Session+Rx.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import SwiftyJSON




extension Reactive where Base: Session {
    
    
    public func requestSwiftyJSON(_ method: HTTPMethod,
                                  _ url: URL,
                                  parameters: Parameters? = nil,
                                  encoding: ParameterEncoding = URLEncoding.default,
                                  headers: HTTPHeaders? = nil,
                                  interceptor: RequestInterceptor? = nil) -> Observable<(JSON)> {
        
        var interceptor = interceptor
        
        if interceptor == nil {
            interceptor = Adapter.networkInterceptor
        }
        
        return self.responseJSON(method,
                          url,
                          parameters: parameters,
                          encoding: encoding,
                          headers: headers,
                          interceptor: interceptor)
            .map { (_, json) -> JSON in JSON(json) }
    }
    
}
