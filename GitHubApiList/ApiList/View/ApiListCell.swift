//
//  ApiListCell.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit

class ApiListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ApiListCell: DataSourceCellType {
    func configCellVM(cellVM: DataSourceCellVMType) {
        
        if let cellVM = cellVM as? ApiListCellVM {
            self.textLabel?.text = cellVM.title
            self.detailTextLabel?.text = cellVM.subTitle
        }
        
    }
}
