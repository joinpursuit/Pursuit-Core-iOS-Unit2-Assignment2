//
//  EpisodeViewController.swift
//  GameOfThrones
//
//  Created by Ari Rivera on 12/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var gotEpisodes: GOTEpisode!

    @IBOutlet weak var episodeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        episodeTextView.text = gotEpisodes.summary
        
    }
    

}
