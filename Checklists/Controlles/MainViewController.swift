//
//  ViewController.swift
//  Checklists
//
//  Created by ASDiMac5 on 15/04/22.
//

import UIKit
import Foundation

class MainViewController: UITableViewController, GroupDetailsProtocol {
    // Mark: - GroupDeleteProtocol
    func didDeleteItem(at index: Int, with groupTitle: String) {
        for (groupIndex, group) in groups.enumerated() {
            if group.title == groupTitle {
                groups[groupIndex].items.remove(at: index)
            }
        }
    }
    
    
// Mark: - data layer
    
    var groups: [ChecklistGroup] =
    [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays", items: [
            ChecklistsItem(isChecked: true, name: "Selena's Birthday", remindME: false, dueDate: nil)]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [
            ChecklistsItem(isChecked: true, name: "Apples, Juice, Blueberries", remindME: true)]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [
            ChecklistsItem(isChecked: true, name: "Clean the house", remindME: false)]),
        ChecklistGroup(title: "Business Stuff", imageName: "Folder", items: [
            ChecklistsItem(isChecked: false, name: "Buy a car", remindME: true)])
    ]
    
    // Mark: - Life cycle of View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add observer
        NotificationCenter.default.addObserver(self, selector: #selector(handleLetNoteNotification), name: .noteHasBeenCreated, object: nil)
    }
    
    @objc
    func handleLetNoteNotification(_ notification: Notification) {
        print("asdasd")
        if let object = notification.object as? (ChecklistsItem, String) {
            print("Creating new note")
            print("Received value: \(object)")
            for (index, group) in groups.enumerated() {
                if group.title == object.1 {
                   // group.items.append(object.0)
                    groups[index].items.append(object.0)
                    print(group.items)
                    tableView.reloadData()
                }
            }
          
        }
    }
    
    // Mark: - Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groups[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath ) as! GroupTableViewCell
        
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        cell.subtitleLabel.text = group.title
        cell.subtitleLabel.text = group.getDoneRemainings()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails" {
            if let viewCon = segue.destination as? GroupDetailsTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    viewCon.title = groups[indexPath.row].title
                    viewCon.group = groups[indexPath.row]
                    viewCon.delegate = self
          
                }
            }
        }
        
    }
    }

