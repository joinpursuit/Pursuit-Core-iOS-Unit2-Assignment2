//
//  EpisodeDetailViewController.swift
//  GameOfThrones
//
//  Created by casandra grullon on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var gotEpisode: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData(){
        episodeImage.image = UIImage(named: gotEpisode.originalImageID)
        episodeNameLabel.text = gotEpisode.name
        episodeNumberLabel.text = gotEpisode.number.description
        seasonNumberLabel.text = gotEpisode.season.description
        runtimeLabel.text = gotEpisode.runtime.description
        airDateLabel.text = gotEpisode.airdate
        descriptionLabel.text = gotEpisode.summary
    }
    

}
