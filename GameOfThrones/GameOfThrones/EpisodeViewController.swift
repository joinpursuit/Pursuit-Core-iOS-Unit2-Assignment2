//
//  EpisodeViewController.swift
//  GameOfThrones
//
//  Created by Yuliia Engman on 11/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var fullImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var runtimaLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        guard let thisEpisode = episode else {
            fatalError("cannot get GOTEpisode data")
        }
        
        fullImage.image = UIImage(named: thisEpisode.originalImageID)
        nameLabel.text = thisEpisode.name
        seasonLabel.text = "Season: \(thisEpisode.season)"
        episodeLabel.text = "Episode: \(thisEpisode.number)"
        runtimaLabel.text = "Runtime: \(thisEpisode.runtime)"
        airdateLabel.text = "Airdate: \(thisEpisode.airdate)"
        descriptionTextView.text = thisEpisode.summary
    }

}
