//
//  MovieTableViewCell.swift
//  GameOfThrones
//
//  Created by Yuliia Engman on 11/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    func configureCell(for movie: GOTEpisode) {
           movieImage.image = UIImage(named: movie.mediumImageID.description)
           nameLabel.text = movie.name
           subLabel.text = "S: \(movie.season) E: \(movie.number)"
       }

}
