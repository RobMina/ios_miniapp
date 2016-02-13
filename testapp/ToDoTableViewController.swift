//
//  ToDoTableViewController.swift
//  testapp
//
//  Created by Robert Mina on 2/12/16.
//  Copyright © 2016 University of Virginia. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    //Mark: Properties
    var items = [ToDoItem?] ()
    //var chosenCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadItems() {
        let title1 = String("Test Event 1")
        let desc1 = String("test event description 1")
        let date1 = NSDate(timeIntervalSinceNow: NSTimeInterval(30.0))
        
        items += [ToDoItem(title:title1,description:desc1,duedate:date1)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ToDoTableViewCell
        
        let item=items[indexPath.row]
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/YY HH:mm:ss"
        let dateString = dateFormatter.stringFromDate((item?.duedate)!)
        
        cell.infoTextView.text = item?.description
        cell.titleLabel.text = item?.title
//        cell.toggle.setOn((item?.toggled)!, animated: false)
        cell.dateLabel.text = dateString
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // let the controller to know that able to edit tableView's row
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?  {
        // add the action button you want to show when swiping on tableView's cell , in this case add the delete button.
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action , indexPath) -> Void in
            self.items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    @IBAction func unwindToToDoList(sender: UIStoryboardSegue) {
        print("Inside unwindToToDoList")
        if let sourceViewController = sender.sourceViewController as? AddItemViewController, item=sourceViewController.item {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                items[selectedIndexPath.row] = item
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                let newIndexPath = NSIndexPath(forRow: items.count, inSection: 0)
                items.append(item)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            print("Inside prepareForSegue")
            let itemDetailViewController = segue.destinationViewController as! AddItemViewController
            if let selectedItemCell = sender as? ToDoTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedItemCell)!
                let selectedItem = items[indexPath.row]
                itemDetailViewController.item = selectedItem
            }
        }
        else if segue.identifier == "AddItem" {
        }
    }
    

}
