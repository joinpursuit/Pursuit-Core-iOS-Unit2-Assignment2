//
//  SecondTableViewCell.swift
//  GameOfThrones
//
//  Created by Liubov Kaper  on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    
    @IBOutlet weak var seasonEpisodeNumberLabel: UILabel!
    
    func configureSecondCell(for episode: GOTEpisode) {
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        episodeNameLabel.text = episode.name
        seasonEpisodeNumberLabel.text = "S: \(episode.season) E: \(episode.number)"
    }
}
