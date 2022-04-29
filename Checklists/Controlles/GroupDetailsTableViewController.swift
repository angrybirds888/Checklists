//
//  GroupDetailsTableViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 22/04/22.
//

import UIKit


class GroupDetailsTableViewController: UITableViewController {
    
    var items: [ChecklistsItem] = []


    override func viewDidLoad() {
        super.viewDidLoad()

     
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistsItems", for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        cell.titleLabel.text = item.name
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupDetailsToIconDetails",
            let viewCon = segue.destination as? AddItemTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            viewCon.title = "Edit item"
            viewCon.item = items[indexPath.row]
        }
    }
}
