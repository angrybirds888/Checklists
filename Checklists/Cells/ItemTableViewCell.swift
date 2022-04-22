//
//  ItemTableViewCell.swift
//  Checklists
//
//  Created by ASDiMac5 on 22/04/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkIcon: UIImageView!
    @IBOutlet weak var infoIcon: UIImageView!
    @IBOutlet weak var chevronIcon: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
