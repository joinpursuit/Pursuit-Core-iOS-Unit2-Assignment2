//
//  EpisodeDetailControllerViewController.swift
//  GameOfThrones
//
//  Created by Stephanie Ramirez on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeDetailController: UIViewController {

    //outlets
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeEpisode: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirdate: UILabel!
    //we need the selected cell's data
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEpisodeUI()
        // Do any additional setup after loading the view.
    }
    
    private func updateEpisodeUI () {
        let episodeImageOriginal: UIImage = UIImage(named: (episode?.originalImageID)!)!

        episodeImage.image = episodeImageOriginal
        episodeName.text = episode?.name
        episodeDescription.text = episode?.summary
        episodeSeason.text = "Season: \(String(describing: episode!.season))"
        episodeEpisode.text = "Episode: \(String(describing: episode!.number))"
        episodeRuntime.text = "Runtime: \(String(describing: episode!.runtime)) minutes"
        episodeAirdate.text = "Airdate: \(String(describing: episode!.airdate))"
        
    }
    
}
