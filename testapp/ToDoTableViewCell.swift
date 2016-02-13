//
//  ToDoTableViewCell.swift
//  testapp
//
//  Created by Robert Mina on 2/8/16.
//  Copyright © 2016 University of Virginia. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func toggleSwitched(sender: UISwitch) {
    }

}
