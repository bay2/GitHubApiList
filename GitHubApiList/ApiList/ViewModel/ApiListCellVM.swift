//
//  ApiListCellVM.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//

import Foundation

struct ApiListCellVM {
    var title: String
    var subTitle: String
}

extension ApiListCellVM: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.subTitle == rhs.subTitle
    }
    
}
