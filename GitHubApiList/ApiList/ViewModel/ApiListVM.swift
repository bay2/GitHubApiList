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
    
    @PublishRelayWrap var dataSources: [ApiListCellVM] = []
    
    /// 启动
    func setup() {
        
        fetchDataFromRemote()
            .bind(to: $dataSources)
            .disposed(by: self.disposeBag)
        
        timerFetchDataFromRemote()
            .bind(to: $dataSources)
            .disposed(by: self.disposeBag)
        
    }
    
    
    /// 定时从服务端抓取数据
    /// - Returns: cell viewModel Observable
    func timerFetchDataFromRemote() -> Observable<[ApiListCellVM]> {
        
        Observable<Int>
            .timer(.seconds(5), scheduler: SerialDispatchQueueScheduler.networkingQequestQ)
            .flatMap { [weak self] (_) -> Observable<[ApiListCellVM]> in
                guard let `self` = self else { return Observable.empty() }
                return self.fetchDataFromRemote()
            }
        
    }
    
    
    /// 从服务端抓取数据
    /// - Returns: cell viewModel Observable
    func fetchDataFromRemote() -> Observable<[ApiListCellVM]> {
        RxAlamofire.requestJSON(.get, URL.gitHubApiList)
            .map { (_, json) -> JSON in JSON(json) }
            .map { (json) -> [ApiListCellVM] in
                json.map { (key, value) -> ApiListCellVM in
                    ApiListCellVM(title: key, subTitle: value.stringValue)
                }
            }
    }
    

    
}
