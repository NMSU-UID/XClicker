//
//  CourseTableViewCell.swift
//  bonjour-demo-ios
//
//  Created by Elena on 11/27/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
