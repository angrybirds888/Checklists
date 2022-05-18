//
//  TextTableViewCell.swift
//  Checklists
//
//  Created by ASDiMac5 on 25/04/22.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    var onChange: ((String) -> Void)?
    
    @IBOutlet weak var addItemTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func textEditingChanged(_ sender: UITextField) {
        print(sender.text)
        if let text = sender.text {
            onChange?(text)
        }
    }
}
