//
//  ToDoItem.swift
//  testapp
//
//  Created by Robert Mina on 2/12/16.
//  Copyright © 2016 University of Virginia. All rights reserved.
//

import UIKit

class ToDoItem {
    
    //MARK: Properties
    var title: String
    var description: String
    var toggled: Bool
    var duedate: NSDate
    
    //MARK: Initialization
    init?(title:String, description:String, duedate:NSDate) {
        toggled = false
        self.title = title
        self.description = description
        self.duedate = duedate
        if title.isEmpty || duedate.timeIntervalSinceDate(NSDate.init()) < 0 {
            return nil
        }
    }
    
    
    
    
}