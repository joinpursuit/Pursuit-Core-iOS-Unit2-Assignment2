//
//  DetailedViewController.swift
//  GameOfThrones
//
//  Created by Cameron Rivera on 11/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    weak var currentEpisode: GOTEpisode!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDisplay.image = UIImage(named: "\(currentEpisode.originalImageID)")
        episodeName.text = currentEpisode.name
        seasonLabel.text = "Season: \(currentEpisode.season)"
        episodeNumberLabel.text = "Episode: \(currentEpisode.number)"
        runtimeLabel.text = "Runtime: \(currentEpisode.runtime)"
        airDateLabel.text = "Airdate: \(currentEpisode.airdate)"
        descriptionTextView.text = currentEpisode.summary
        
    }

}
