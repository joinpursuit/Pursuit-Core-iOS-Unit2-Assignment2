//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Jane Zhu on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var epImage: UIImageView!
    @IBOutlet weak var epName: UILabel!
    @IBOutlet weak var epSeason: UILabel!
    @IBOutlet weak var epNumber: UILabel!
    @IBOutlet weak var epRuntime: UILabel!
    @IBOutlet weak var epAirdate: UILabel!
    
    @IBOutlet weak var epSynopsis: UITextView!
    
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateEpisodeUI()
    }
    
    private func updateEpisodeUI() {
        epImage.image = UIImage(named: (episode?.originalImageID)!)
        epName.text = episode?.name
        epSeason.text = "Season: " + String(episode!.season)
        epNumber.text = "Number: " + String(episode!.number)
        epRuntime.text = "Runtime: " + String(episode!.runtime)
        epAirdate.text = "Airdate: " + episode!.airdate
        epSynopsis.text = episode?.summary
    }
    

}
