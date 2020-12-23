//
//  ApiListCellVM.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import UIKit
import RxDataSources

struct ApiListCellVM {
    var title: String
    var subTitle: String
}

extension ApiListCellVM: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.subTitle == rhs.subTitle
    }
    
}

extension ApiListCellVM: DataSourceCellVMType {
    
    var cellType: UITableViewCell.Type { ApiListCell.self }
    
}

extension ApiListCellVM: IdentifiableType {
    var identity: String { title }
}
