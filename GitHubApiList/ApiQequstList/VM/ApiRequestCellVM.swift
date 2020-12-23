//
//  ApiRequestCellVM.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit
import RxDataSources

typealias ApiRequestCellVM = ApiRequestLog

extension ApiRequestCellVM: DataSourceCellVMType {
    
    var cellType: UITableViewCell.Type { ApiRequestCell.self }

}

extension ApiRequestCellVM: IdentifiableType {
    var identity: String {
        self.id
    }
}
