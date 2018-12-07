//
//  EpisodeViewController.swift
//  GameOfThrones
//
//  Created by Ari Rivera on 12/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var gotEpisodes: GOTEpisode!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    @IBOutlet weak var episodeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = gotEpisodes.name
        seasonLabel.text = "Season: " + gotEpisodes.season.description
        episodeNumber.text = "Episode: " + gotEpisodes.number.description
        runtimeLabel.text = "Runtime: " + gotEpisodes.runtime.description
        airdateLabel.text = "Airdate: " + gotEpisodes.airdate
        
        episodeTextView.text = gotEpisodes.summary
        
    }
    

}
