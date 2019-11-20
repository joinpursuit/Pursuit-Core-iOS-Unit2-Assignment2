//
//  EpisodeViewController.swift
//  GameOfThrones
//
//  Created by Lilia Yudina on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeSeasonLabel: UILabel!
    @IBOutlet weak var episodeEpisodeLabel: UILabel!
    @IBOutlet weak var episodeRuntimeLabel: UILabel!
    @IBOutlet weak var episodeAirDateLabel: UILabel!
    @IBOutlet weak var episodeDescription: UILabel!

    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
     
    }
    
    func updateUI() {
        guard let theEpisode = episode else {
            fatalError("Couldn't get an episode value, verify prepare(for segue: ")
        }
        title = theEpisode.name
        episodeImageView.image = UIImage(named: "\(theEpisode.originalImageID)")
        episodeNameLabel.text = theEpisode.name
        episodeSeasonLabel.text = "Season: \(theEpisode.season)"
        episodeEpisodeLabel.text = "Episode: \(theEpisode.number)"
        episodeRuntimeLabel.text = "Runtime: \(theEpisode.runtime)"
        episodeAirDateLabel.text = "Airdate: \(theEpisode.airdate)"
        episodeDescription.text = theEpisode.summary
    }

}
