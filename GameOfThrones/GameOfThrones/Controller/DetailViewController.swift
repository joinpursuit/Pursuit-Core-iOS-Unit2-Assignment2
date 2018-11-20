//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Biron Su on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var episode: GOTEpisode?
    @IBOutlet weak var gotImageTwo: UIImageView!
    @IBOutlet weak var gotTextView: UITextView!
    @IBOutlet weak var gotTitleTwo: UILabel!
    @IBOutlet weak var gotSeason: UILabel!
    @IBOutlet weak var gotEpisode: UILabel!
    @IBOutlet weak var gotRunTime: UILabel!
    @IBOutlet weak var gotAirDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp() {
        if episode != nil {
            gotImageTwo.image = UIImage(named: episode!.mediumImageID)
            gotTextView.text = episode?.summary
            gotTitleTwo.text = episode?.name
            gotSeason.text = "Season: \(episode!.season)"
            gotEpisode.text = "Episode: \(episode!.number)"
            gotRunTime.text = "Runtime: \(episode!.runtime)"
            gotAirDate.text = "Air Date: \(episode!.airdate)"
        }
    }
}
