//
//  ApiRequestLogVC.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit
import RxSwift

class ApiRequestLogVC: UIViewController {
    
    @IBOutlet private weak var list: UITableView!
    
    let apiRequestLogVM = ApiRequestLogVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSourceAdapter()
        apiRequestLogVM.setup()
        
    }

}

extension ApiRequestLogVC: DataSourceAdapterable {
    
    var disposeBag: DisposeBag { self.rx.disposeBag }
    
    var tableView: UITableView { list }
    
    var dataSources: PublishRelayWrap<[DataSourceSection<ApiRequestCellVM>]> { apiRequestLogVM.$dataSources }
    
}
