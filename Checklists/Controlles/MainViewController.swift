//
//  ViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 15/04/22.
//

import UIKit

class MainViewController: UITableViewController {
    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays", items: [
            ChecklistsItem(isChecked: true, name: "Selena's Birthday")
        ]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [ChecklistsItem(isChecked: true, name: "Apples, Juice, Blueberries")]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [ChecklistsItem(isChecked: true, name: "Clean the house")]),
        ChecklistGroup(title: "Business Stuff", imageName: "Folder", items: [ChecklistsItem(isChecked: false, name: "Buy a car")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groups[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath ) as! GroupTableViewCell
        
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        cell.subtitleLabel.text = group.title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails" {
            if let viewCon = segue.destination as? GroupDetailsTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    viewCon.title = groups[indexPath.row].title
                    viewCon.items = groups[indexPath.row].items
          
                }
            }
        }
        
    }
}
