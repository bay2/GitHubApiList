//
//  DataSourceCellType.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit

protocol DataSourceCellType where Self: UITableViewCell {
    func configCellVM(cellVM: DataSourceCellVMType)
}

extension DataSourceCellType {
    func configCellVM(cellVM: DataSourceCellVMType) {}
}

