//
//  GOTViewCell.swift
//  GameOfThrones
//
//  Created by Biron Su on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTViewCell: UITableViewCell {
    
    @IBOutlet weak var gotImage: UIImageView!
    @IBOutlet weak var gotTitle: UILabel!
    @IBOutlet weak var gotInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
