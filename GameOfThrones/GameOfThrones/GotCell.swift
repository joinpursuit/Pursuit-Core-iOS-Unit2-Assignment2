//
//  GotCell.swift
//  GameOfThrones
//
//  Created by Bienbenido Angeles on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GotCell: UITableViewCell {
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var seasonNameLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!
    
    func configureCell(for episode: GOTEpisode){
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        seasonNameLabel.text = episode.name
        seasonEpisodeLabel.text = "S:\(episode.season) E:\(episode.number)"
    }
}
