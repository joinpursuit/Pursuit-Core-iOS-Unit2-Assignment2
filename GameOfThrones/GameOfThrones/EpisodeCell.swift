//
//  EpisodeCell.swift
//  GameOfThrones
//
//  Created by casandra grullon on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    func configureCell(for episode: GOTEpisode ) {
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        episodeTitleLabel.text = episode.name
        episodeNumberLabel.text = episode.number.description
    }

}
