//
//  GOTviewCell.swift
//  GameOfThrones
//
//  Created by Joshua Viera on 11/19/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class GOTviewCell: UITableViewCell {

    @IBOutlet weak var GOTimage: UIImageView!
    @IBOutlet weak var seasonAndEpisode: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
