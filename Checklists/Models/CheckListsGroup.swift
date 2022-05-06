//
//  CheckListsGroup.swift
//  Checklists
//
//  Created by ASDiMac5 on 18/04/22.
//

import Foundation

struct ChecklistGroup {
    var title : String
    var imageName : String
    var items: [ChecklistsItem]
    
    func getDoneRemainings() -> String {
        // To Do
        //1. All Done
        var isAllDone = true
        for item in items {
            if item.isChecked == false {
                isAllDone = false
            }
            if items.isEmpty {
            return "(no items)"
            } else if !isAllDone, items.count != 0 {
                        return "\(items.count) Remaining"
                    }
        }
        if isAllDone {
            return "All Done"
        } else {
            return "Incorrect data"
        }

        
        
    }
}
