//
//  ApiRequestCell.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//

import UIKit

class ApiRequestCell: UITableViewCell {

    @IBOutlet private weak var methodView: UIView!
    @IBOutlet private weak var titleLab: UILabel!
    @IBOutlet private weak var methodLab: UILabel!
    @IBOutlet private weak var requestTimeLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        methodView.layer.cornerRadius = 4
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ApiRequestCell: DataSourceCellType {
    
    func configCellVM(cellVM: DataSourceCellVMType) {
        
        if let cellVM = cellVM as? ApiRequestCellVM {
            
            titleLab.text = cellVM.url
            methodLab.text = cellVM.method
            requestTimeLab.text = cellVM.requestTime.string()
            
        }
        
    }
    
}
