//
//  DashboardTableViewCell.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: PostUIModel) {
        self.idLabel.text = String(item.id)
        self.userIdLabel.text = String(item.userId)
        self.titleLabel.text = item.title
        self.bodyLabel.text = item.body
    }
    
}
