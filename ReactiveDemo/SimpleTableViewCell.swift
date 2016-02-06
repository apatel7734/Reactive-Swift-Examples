//
//  SimpleTableViewCell.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 2/5/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    @IBOutlet weak var simpleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
