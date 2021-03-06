//
//  DateTableViewCell.swift
//  Checklists
//
//  Created by ASDiMac5 on 25/04/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    var onDateChanged: ((Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func dateEditingChanged(_ sender: UIDatePicker) {
        onDateChanged?(sender.date)
    }
}
