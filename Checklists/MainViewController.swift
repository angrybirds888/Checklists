//
//  ViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 15/04/22.
//

import UIKit

class MainViewController: UITableViewController {

    let groups: [ChecklistGroup] = [ChecklistGroup(title: "Birthdays", imageName: "birthdayspic"), ChecklistGroup(title: "Groceries", imageName: "groceriespic"), ChecklistGroup(title: "To Do", imageName: "To Do pics"), ChecklistGroup(title: "Business Stuff", imageName: "Business pics")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group: ChecklistGroup = groups[indexPath.row]
         let cell = UITableViewCell()
        
        
        cell.textLabel?.text = group.title
        return cell
    }
}
