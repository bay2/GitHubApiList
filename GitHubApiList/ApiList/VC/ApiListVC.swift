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
    var dataSourceAdapter: DataSourceAdapter<DataSourceSection<ApiListCellVM>>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSourceAdapter = DataSourceAdapter<DataSourceSection<ApiListCellVM>>(self, dataSources: apiListVM.$dataSources.observed)
        
        apiListVM.setup()
        
    }

}

extension ApiListVC: DataSourceAdapterDelegate {
    
    var tableView: UITableView { list }
    
    
}
