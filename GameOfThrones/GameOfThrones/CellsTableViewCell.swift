//
//  CellsTableViewCell.swift
//  GameOfThrones
//
//  Created by Yuliia Engman on 11/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CellsTableViewCell: UITableViewCell {
    
   
    
    func configureRightCell(for episode: GOTEpisode) {
        
        rightImage.image = UIImage(named: episode.mediumImageID)
        rightImageNameLabel.text = episode.name
        rigthImageSubLabel.text = "S: \(episode.season) E: \(episode.number)"
    }
}


