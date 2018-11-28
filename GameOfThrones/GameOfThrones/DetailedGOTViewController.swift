//
//  DetailedGOTViewController.swift
//  GameOfThrones
//
//  Created by Donkemezuo Raymond Tariladou on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailedGOTViewController: UIViewController {
    
    var currentMovie: GOTEpisode!
    
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var seasonSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    private func updateUI(){
        originalImage.image = UIImage(named: currentMovie.originalImageID)
        subTitle.text = currentMovie.name
        season.text = "Season: \(currentMovie.season)"
        episode.text = "Episode: \(currentMovie.number)"
        runTime.text = "Runtime: \(currentMovie.runtime)"
        airDate.text = "AirDate: \(currentMovie.airdate)"
        seasonSummary.text = currentMovie.summary
        
    }
}
