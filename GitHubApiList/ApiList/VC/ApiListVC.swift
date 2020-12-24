//
//  ApiListVC.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import UIKit
import RxSwift
import RxCocoa


class ApiListVC: UIViewController {
    
    
    @IBOutlet private weak var list: UITableView!
    
    let apiListVM = ApiListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSourceAdapter()
        
        apiListVM.setup()
        
    }

}

extension ApiListVC: DataSourceAdapterable {
    
    var disposeBag: DisposeBag { self.rx.disposeBag }
    
    var tableView: UITableView { list }
    
    var dataSources: PublishRelayWrap<[DataSourceSection<ApiListCellVM>]> { apiListVM.$dataSources }
    
    
}
