//
//  SwitchTableViewCell.swift
//  Checklists
//
//  Created by ASDiMac5 on 25/04/22.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    var onChange: ((Bool) -> Void)?

    @IBOutlet weak var remindMeSwitcher: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchDidChange(_ sender: UISwitch){
//        if let switchButton = sender.isOn {
        onChange?(sender.isOn)
//        }
        print("Value of switch:\(sender.isOn)")
    }
    
}

