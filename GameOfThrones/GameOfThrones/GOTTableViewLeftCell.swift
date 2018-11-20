//
//  GOTTableViewLeftCell.swift
//  GameOfThrones
//
//  Created by Donkemezuo Raymond Tariladou on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTTableViewLeftCell: UITableViewCell {

    @IBOutlet weak var myLeftEpisodeImage: UIImageView!
   
    @IBOutlet weak var GOTLeftSeasonTitle: UILabel!
    @IBOutlet weak var LeftSeasonNumberAndEpisode: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
