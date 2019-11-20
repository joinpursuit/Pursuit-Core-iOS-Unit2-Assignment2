//
//  EvenNumberCell.swift
//  GameOfThrones
//
//  Created by casandra grullon on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EvenNumberCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    func configureEvenCells(for episode: GOTEpisode){
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        episodeNameLabel.text = episode.name
        episodeNumberLabel.text = "S:" + episode.season.description + " " + "E:" + episode.number.description
    }
}
