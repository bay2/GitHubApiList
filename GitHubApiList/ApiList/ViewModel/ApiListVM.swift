//
//  ApiListVM.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import SwiftyJSON

/// API 列页面的 ViewModel
class ApiListVM {
    
    let disposeBag = DisposeBag()
    
    @PublishRelayWrap var dataSources: [DataSourceSection<ApiListCellVM>] = []
    
    /// 启动
    func setup() {
        
        fetchDataFromLocal()
            .map { [DataSourceSection(items: $0, sectionName: "apilist")] }
            .bind(to: $dataSources)
            .disposed(by: self.disposeBag)
        
        timerFetchDataFromRemote()
            .map { [DataSourceSection(items: $0, sectionName: "apilist")] }
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: $dataSources)
            .disposed(by: self.disposeBag)
        
    }
    
    
    /// 定时从服务端抓取数据
    /// - Returns: cell viewModel Observable
    func timerFetchDataFromRemote() -> Observable<[ApiListCellVM]> {
        
        Observable<Int>
            .timer(.never, period: .seconds(5), scheduler: SerialDispatchQueueScheduler.networkingRequestQ)
            .flatMap { [weak self] (_) -> Observable<[ApiListCellVM]> in
                guard let `self` = self else { return Observable.empty() }
                return self.fetchDataFromRemote()
            }
        
    }
    
        
    /// 从服务端抓取数据
    /// - Returns: cell viewModel Observable
    func fetchDataFromRemote() -> Observable<[ApiListCellVM]> {
        Alamofire.Session.default.rx.requestSwiftyJSON(.get, URL.gitHubApiList)
            .do(onNext: { (json) in
                ApiInfoModel.writeApiInfo(json: json)
            })
            .map { (json) -> [ApiListCellVM] in
                json.map { (key, value) -> ApiListCellVM in
                    ApiListCellVM(title: key, subTitle: value.stringValue)
                }
                .sorted { (value1, value2) -> Bool in
                    value1.title < value2.title
                }
            }
        
    }
    
    
    /// 从本地数据库获取数据
    /// - Returns: cell viewModel Observable
    func fetchDataFromLocal() -> Observable<[ApiListCellVM]> {
        
        var cellVMs: [ApiListCellVM] = []
        
        if let apiInfos = ApiInfoModel.getApiInfos() {
            
            for apiInfo in apiInfos {
                cellVMs.append(ApiListCellVM(title: apiInfo.apiName, subTitle: apiInfo.apiURL))
            }
            
        }

        return Observable.just(cellVMs)
        
        
    }
    
    

    
}
