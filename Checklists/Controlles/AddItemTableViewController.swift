//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 25/04/22.
//

import UIKit
import Foundation

class AddItemTableViewController: UITableViewController {
    
    var item: ChecklistsItem?
    
    var categoryName: String?
    var name: String = ""
    var remindMe: Bool = false
    var date: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let item = item {
            if item.remindME {
                return 3
            } else {
                return 2
            }
        } else {
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextTableViewCell
            cell.onChange = { text in
                self.name = text
            }
            if let item = item {
                cell.addItemTextField.text = item.name
            }
        
        return cell
        
    }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchTableViewCell
            cell.remindMeSwitcher.setOn(item?.remindME ?? false, animated: true)
            cell.onChange = { isOn in
                self.remindMe = isOn
            }
            return cell
        }

        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTableViewCell
            if let item = item,
               let date = item.dueDate {
                cell.datePicker.setDate(date, animated: true)
            }
            cell.onDateChanged = { date in
                self.date = date
            }
            return cell
        }
    }
   
    @IBAction func SaveItem(_ sender: Any) {
        NotificationCenter.default.post(name: .noteHasBeenCreated, object: 44)
        let object1 = ChecklistsItem(isChecked: false, name: name, remindME: remindMe, dueDate: date)
        let object2: (ChecklistsItem, String) = (object1, categoryName ?? "No category")
        NotificationCenter.default.post(name: .noteHasBeenCreated, object: object2)
        print(object2)
        
        navigationController?.popToRootViewController(animated: true)
    }
    

}
