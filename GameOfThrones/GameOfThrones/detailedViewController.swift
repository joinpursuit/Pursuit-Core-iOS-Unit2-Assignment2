//
//  DetailedViewController.swift
//  GameOfThrones
//
//  Created by Olimpia on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    

    @IBOutlet weak var episodePicture: UIImageView!
    @IBOutlet weak var nameOfEpisode: UILabel!
    @IBOutlet weak var numberOfTheSeason: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var episodeDescription: UITextView!
    
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateEpisodeUI()
     
    }
    

    private func updateEpisodeUI() {
       
        episodePicture.image = UIImage(named: episode?.mediumImageID ?? "")
        
        numberOfTheSeason.text = "Season: \(episode?.season ?? 0)"
        
        episodeNumber.text = "Episode: \(episode?.number ?? 0)"
        
        duration.text = "Runtime: \(episode?.runtime ?? 0)"
        
        airDate.text = "Airdate: \(episode?.airdate ?? "")"
      
        episodeDescription.text = episode?.summary
        
        nameOfEpisode.text = episode?.name
    }

}
