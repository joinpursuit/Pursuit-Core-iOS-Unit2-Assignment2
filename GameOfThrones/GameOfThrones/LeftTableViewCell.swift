//
//  LeftTableViewCell.swift
//  GameOfThrones
//
//  Created by Yuliia Engman on 11/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {
    
    
    
    func configureLeftCell(for episode: GOTEpisode) {
           
           rightImage.image = UIImage(named: episode.mediumImageID)
           rightImageNameLabel.text = episode.name
           rigthImageSubLabel.text = "S: \(episode.season) E: \(episode.number)"
       }

}
