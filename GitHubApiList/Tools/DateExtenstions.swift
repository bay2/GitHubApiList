//
//  DateExtenstions.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import Foundation


extension Date {
    
    func string(withFormat format: String = "yyyy-MM-dd HH:mm:ss.SSSS") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
