//
//  DataSourceSectionType.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit
import RxDataSources

protocol DataSourceSectionType where Item: DataSourceCellVMType {
    
    associatedtype Item
    
    var items: [Item] { get }
    
}

struct DataSourceSection<Item: DataSourceCellVMType & IdentifiableType & Equatable>: DataSourceSectionType {
    var items: [Item]
    var sectionName: String
    
}

extension DataSourceSection: AnimatableSectionModelType {
    

    var identity: String {
        sectionName
    }
    
    init(original: DataSourceSection<Item>, items: [Item]) {
        self = original
        self.items = items
    }
    
    
    
}
