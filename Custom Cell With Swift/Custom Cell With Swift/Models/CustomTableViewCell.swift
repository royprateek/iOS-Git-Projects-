//
//  CustomTableViewCell.swift
//  Custom Cell With Swift
//
//  Created by Prateek Roy on 02/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellCEO: UILabel!
    @IBOutlet weak var cellCompany: UILabel!
    @IBOutlet weak var cellWebsites: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
