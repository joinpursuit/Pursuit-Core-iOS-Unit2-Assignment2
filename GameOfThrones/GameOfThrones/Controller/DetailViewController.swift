//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Nathalie  on 11/20/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var got: GOTEpisode!
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    
    @IBOutlet weak var episodeSeason: UILabel!
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    @IBOutlet weak var episodeRuntime: UILabel!
    
    @IBOutlet weak var episodeAirdate: UILabel!
    
    @IBOutlet weak var episodeDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeImage.image = UIImage(named: got.mediumImageID)
        episodeTitle.text = got.name
        episodeSeason.text = "Season \(got.season)"
        episodeNumber.text = "Episode \(got.number)"
        episodeRuntime.text = "Runtime \(got.runtime)"
        episodeAirdate.text = "Airdate \(got.airdate)"
        episodeDescription.text = "\(got.summary)"
        
    }

}
