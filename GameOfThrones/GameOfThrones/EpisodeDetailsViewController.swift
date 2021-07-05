//
//  EpisodeDetailsViewController.swift
//  GameOfThrones
//
//  Created by Pritesh Nadiadhara on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    var allEpisodes = GOTEpisode.allEpisodes
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeStill: UIImageView!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var episodeDesc: UITextView!
    
    var episodeN : GOTEpisode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    private func setUp() {
        episodeTitle.text = episodeN!.name
        episodeStill.image = UIImage(named: episodeN!.originalImageID)
        season.text = ("Season:\(episodeN!.season)")
        episode.text = ("Episode:\(episodeN!.number)")
        runTime.text = ("Run Time: \(episodeN!.runtime)")
        airDate.text = ("Original Air Date:\(episodeN!.airdate)")
        episodeDesc.text = episodeN!.summary
        
    }
   

}
