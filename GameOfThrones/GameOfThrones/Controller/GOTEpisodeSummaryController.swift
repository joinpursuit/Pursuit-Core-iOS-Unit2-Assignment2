//
//  GOTEpisodeSummaryController.swift
//  GameOfThrones
//
//  Created by Jian Ting Li on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTEpisodeSummaryController: UIViewController {
    
    @IBOutlet weak var episodeImg: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var seasonNum: UILabel!
    @IBOutlet weak var episodeNum: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirdate: UILabel!
    @IBOutlet weak var episodeSummary: UITextView!
    
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEpisodeSummaryUI()
    }
    
    private func updateEpisodeSummaryUI() {
        episodeImg.image = UIImage.init(named: episode!.originalImageID)!
        episodeTitle.text = episode?.name
        seasonNum.text = "Season: \(episode!.season)"
        episodeNum.text = "Episode: \(episode!.number))"
        episodeRuntime.text = "Runtime: \(episode!.runtime)"
        episodeAirdate.text = "Airdate: \(episode!.airdate)"
        episodeSummary.text = episode?.summary
    }
}
