//
//  GOTTableViewRightCell.swift
//  GameOfThrones
//
//  Created by Donkemezuo Raymond Tariladou on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTTableViewRightCell: UITableViewCell {
    @IBOutlet weak var myRightEpisodeImage: UIImageView!
    
    @IBOutlet weak var GOTSeasonTitle: UILabel!
    
    @IBOutlet weak var SeasonNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
