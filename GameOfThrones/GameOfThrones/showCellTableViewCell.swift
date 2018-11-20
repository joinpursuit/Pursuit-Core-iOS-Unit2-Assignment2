//
//  showCellTableViewCell.swift
//  GameOfThrones
//
//  Created by Matthew Huie on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class showCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonAndEpisodeLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
