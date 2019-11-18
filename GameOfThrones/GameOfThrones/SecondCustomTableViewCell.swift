//
//  SecondCustomTableViewCell.swift
//  GameOfThrones
//
//  Created by Cameron Rivera on 11/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var titleDisplayLabel: UILabel!
    @IBOutlet weak var episodeDisplayLabel: UILabel!
    
    func setUp(_ episode: GOTEpisode){
        titleDisplayLabel.text = episode.name
        episodeDisplayLabel.text = "S:\(episode.season) E:\(episode.number)"
        leftImage.clipsToBounds = true
        leftImage?.image = UIImage(named:episode.mediumImageID)
    }


}
