//
//  GroupDetailsTableViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 22/04/22.
//

import UIKit


class GroupDetailsTableViewController: UITableViewController {
    
    var group: ChecklistGroup!
    var delegate: GroupDetailsProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()

     
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistsItems", for: indexPath) as! ItemTableViewCell
        
        let item = group.items[indexPath.row]
        cell.titleLabel.text = item.name
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupDetailsToIconDetails",
            let viewCon = segue.destination as? AddItemTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            viewCon.title = "Edit item"
            viewCon.item = group.items[indexPath.row]
        } else if segue.identifier == "ThirdScreenSegue" {

            let viewCon = segue.destination as? AddItemTableViewController
            viewCon?.categoryName = group.title
            
        }
    }
    // Mark: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("We just tapped \(indexPath.row)")
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        group.items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        delegate?.didDeleteItem(at: indexPath.row, with: group.title)
    }
}
