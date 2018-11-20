//
//  DisplayViewController.swift
//  GameOfThrones
//
//  Created by Joshua Viera on 11/19/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    //outlets
    
    @IBOutlet weak var singleEpisodeImage: UIImageView!
    @IBOutlet weak var singleEpisodeName: UILabel!
    @IBOutlet weak var singleEpisodeSeason: UILabel!
    @IBOutlet weak var singleEpisodeEpisode: UILabel!
    @IBOutlet weak var singleEpisodeRunTime: UILabel!
    @IBOutlet weak var singleEpisodeAirDate: UILabel!
    @IBOutlet weak var singleEpisodeDescription: UITextView!
    
    var episode: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleEpisodeSeason.text = ("Season: \(episode.season)")
        singleEpisodeRunTime.text = ("RunTime: \(episode.runtime)")
        singleEpisodeImage.image = UIImage(named: episode.originalImageID)
        singleEpisodeName.text = episode.name
        singleEpisodeEpisode.text = ("Episode: \(episode.number)")
        singleEpisodeDescription.text = episode.summary
        singleEpisodeAirDate.text = ("AirDate: \(episode.airdate)")
        }
    

    
}
