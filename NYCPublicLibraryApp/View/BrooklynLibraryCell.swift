//
//  BrooklynLibraryTableViewCell.swift
//  NYCPublicLibraryApp
//
//  Created by Jane Zhu on 12/18/18.
//  Copyright © 2018 Jane Zhu. All rights reserved.
//

import UIKit

class BrooklynLibraryCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
