//
//  GOTDetailViewController.swift
//  GameOfThrones
//
//  Created by Liubov Kaper  on 11/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    
    @IBOutlet weak var sesonNumberLabel: UILabel!
    
    
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    
    @IBOutlet weak var runtimeLabel: UILabel!
    
    
    @IBOutlet weak var airtimeLabel: UILabel!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        guard let gotEpisode = episode else {
            fatalError()
        }
        navigationItem.title = gotEpisode.name
        
        episodeImage.image = UIImage(named: gotEpisode.originalImageID)
        episodeNameLabel.text = gotEpisode.name
        episodeNumberLabel.text = "Episode \(gotEpisode.number)"
        runtimeLabel.text = "Runtime \(gotEpisode.runtime)"
        airtimeLabel.text = "Airdate \(gotEpisode.airdate)"
        descriptionTextView.text = gotEpisode.summary
        
    }
    
    
}
