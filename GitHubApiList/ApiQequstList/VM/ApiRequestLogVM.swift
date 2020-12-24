//
//  ApiQequestLogVM.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import Foundation
import RxSwift
import RxCocoa
import RxRealm



/// 请求记录页面 View Model
class ApiRequestLogVM {
    
    let disposeBag = DisposeBag()
    
    @PublishRelayWrap var dataSources: [DataSourceSection<ApiRequestCellVM>] = []
    
    func setup() {
        
        if let records = ApiRequestLog.getQeuestRecord() {
            
            
            dataSources = [DataSourceSection(items: records.toArray(), sectionName: "ApiRequestLog")]
            
            
            Observable.array(from: records)
                .map { [DataSourceSection(items: $0, sectionName: "ApiRequestLog")] }
                .bind(to: $dataSources)
                .disposed(by: disposeBag)
            
        }
        
    }
    
    func clearRecords() {
        
        
        dataSources = [DataSourceSection(items: [], sectionName: "ApiRequestLog")]
        
        ApiRequestLog.clearData()
        
        
    }
    
}
