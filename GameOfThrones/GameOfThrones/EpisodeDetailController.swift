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
    //we need the selected cell's data
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRecipeUI()
        // Do any additional setup after loading the view.
    }
    
    private func updateRecipeUI () {
        let episodeImageOriginal: UIImage = UIImage(named: (episode?.originalImageID)!)!

        episodeImage.image = episodeImageOriginal
        episodeName.text = episode?.name
        episodeDescription.text = episode?.summary
    }
    
}
