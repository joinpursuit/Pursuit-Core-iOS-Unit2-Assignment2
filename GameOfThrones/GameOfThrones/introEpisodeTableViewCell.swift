//
//  introEpisodeTableViewCell.swift
//  GameOfThrones
//
//  Created by Ari Rivera on 12/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class introEpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeOrderLabel: UILabel!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
