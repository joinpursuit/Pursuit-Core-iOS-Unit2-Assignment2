//
//  EpisodeCellRight.swift
//  GameOfThrones
//
//  Created by Lilia Yudina on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCellRight: UITableViewCell {

  @IBOutlet weak var episodeImageView: UIImageView!
  @IBOutlet weak var episodeName: UILabel!
  @IBOutlet weak var episodeID: UILabel!
   
   
   
   func configureCell(for episode: GOTEpisode) {
       episodeImageView.image = UIImage(named: episode.mediumImageID.description)
       episodeName.text = episode.name
       episodeID.text = "S: \(episode.season) E: \(episode.number)"
   }

}
