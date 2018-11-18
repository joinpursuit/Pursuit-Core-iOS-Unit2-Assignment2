//
//  gotViewController.swift
//  GameOfThrones
//
//  Created by Jose Alarcon Chacon on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class gotViewController: UIViewController {
    
    @IBOutlet weak var imageViewOfgot: UIImageView!
    @IBOutlet weak var titleOfgot: UILabel!
    @IBOutlet weak var Season: UILabel!
    @IBOutlet weak var Episode: UILabel!
    @IBOutlet weak var Runtime: UILabel!
    @IBOutlet weak var Airdate: UILabel!
    @IBOutlet weak var texeFile: UITextView!
    
    var episode: GOTEpisode?
    override func viewDidLoad() {
        super.viewDidLoad()
        allEpisode()
    }
    private func allEpisode() {
        imageViewOfgot.image = UIImage(named: episode?.mediumImageID ?? "")
        titleOfgot.text = episode?.name
        Season.text = "Season: \(episode?.season ?? 0)"
        Episode.text = "Episode: \(episode?.number ?? 0)"
        Runtime.text = "Runtime: \(episode?.runtime ?? 0)"
        Airdate.text = "Airdate: \(episode?.airdate ?? "")"
        texeFile.text = episode?.summary
    }
}
