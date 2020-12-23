//
//  ApiRequestLogVC.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit

class ApiRequestLogVC: UIViewController {
    
    @IBOutlet private weak var list: UITableView!
    
    let apiRequestLogVM = ApiRequestLogVM()
    var dataSourceAdapter: DataSourceAdapter<DataSourceSection<ApiRequestCellVM>>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSourceAdapter = DataSourceAdapter<DataSourceSection<ApiRequestCellVM>>(self, dataSources: apiRequestLogVM.$dataSources.observed)
        
        apiRequestLogVM.setup()
        
    }

}

extension ApiRequestLogVC: DataSourceAdapterDelegate {
    
    var tableView: UITableView { list }
    
}
