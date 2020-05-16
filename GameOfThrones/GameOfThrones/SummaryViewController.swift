//
//  SummaryViewController.swift
//  GameOfThrones
//
//  Created by Matthew Huie on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRunTime: UILabel!
    @IBOutlet weak var episodeAirDate: UILabel!
    @IBOutlet weak var episodeSummaryText: UITextView!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSummaryUI()
    }
    
    private func updateSummaryUI() {
        if episode != nil {
            episodeImage.image = UIImage(named: episode!.mediumImageID)
            episodeTitle.text = episode!.name
            seasonNumber.text = "Season: \(episode!.season)"
            episodeNumber.text = "Episode: \(episode!.number)"
            episodeRunTime.text = "Runtime: \(episode!.runtime)"
            episodeAirDate.text = "Airdate: \(episode!.airdate)"
            episodeSummaryText.text = episode!.summary
        }
    }

}
