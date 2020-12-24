//
//  DataSourceAdapter.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

protocol DataSourceAdapterable where Section: AnimatableSectionModelType & DataSourceSectionType {
    
    associatedtype Section
        
    var tableView: UITableView { get }
    
    var disposeBag: DisposeBag { get }
    
    var dataSources: PublishRelayWrap<[Section]> { get }
    
    func setupDataSourceAdapter()
        
}

extension DataSourceAdapterable {
    
    func setupDataSourceAdapter() {
        
        let rxDS = RxTableViewSectionedAnimatedDataSource<Section>(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withClass: item.cellType, for: indexPath)
            
            if let cell = cell as? DataSourceCellType {
                cell.configCellVM(cellVM: item)
            }
            
            return cell
        })
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        dataSources
            .bind(to: tableView.rx.items(dataSource: rxDS))
            .disposed(by: disposeBag)
        
    }
    
}
//
//protocol DataSourceAdapterDelegate: NSObjectProtocol {
//
//    var tableView: UITableView { get }
//
//}
//
//class DataSourceAdapter<Section: AnimatableSectionModelType & DataSourceSectionType> {
//
//    weak var delegate: DataSourceAdapterDelegate?
//
//    let dataSources: PublishRelay<[Section]>
//
//    let disposeBag = DisposeBag()
//
//    required init(_ delegate: DataSourceAdapterDelegate, dataSources: PublishRelay<[Section]>) {
//
//        self.delegate = delegate
//        self.dataSources = dataSources
//
//        let rxDS = RxTableViewSectionedAnimatedDataSource<Section>(configureCell: { _, tableView, indexPath, item in
//            let cell = tableView.dequeueReusableCell(withClass: item.cellType, for: indexPath)
//
//            if let cell = cell as? DataSourceCellType {
//                cell.configCellVM(cellVM: item)
//            }
//
//            return cell
//        })
//
//        let tableView = delegate.tableView
//
//        tableView.estimatedRowHeight = UITableView.automaticDimension
//
//        dataSources
//            .bind(to: tableView.rx.items(dataSource: rxDS))
//            .disposed(by: disposeBag)
//
//    }
//
//
//
//
//
//}
