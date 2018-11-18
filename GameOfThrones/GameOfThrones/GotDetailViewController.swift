//
//  GotDetailViewController.swift
//  GameOfThrones
//
//  Created by Leandro Wauters on 11/17/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GotDetailViewController: UIViewController {

    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirDate: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    
    
    var episode: GOTEpisode?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEpisodeUI()

    }
    private func updateEpisodeUI() {
        episodeImage.image = UIImage(named: episode?.mediumImageID ?? "")
        episodeTitle.text = episode?.name
        episodeSeason.text = "Season: \(episode?.season ?? 0)"
        episodeNumber.text = "Episode: \(episode?.number ?? 0)"
        episodeRuntime.text = "Runtime: \(episode?.runtime ?? 0)"
        episodeAirDate.text = "Airdate: \(episode?.airdate ?? "")"
        episodeDescription.text = episode?.summary
    }

}
