//
//  DetailedGOTController.swift
//  GameOfThrones
//
//  Created by Elizabeth Peraza  on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailedGOTController: UIViewController {
  
  @IBOutlet weak var imageViewGOTDetailed: UIImageView!
  
  @IBOutlet weak var episodeTitleDetailedView: UILabel!
  
  
  
  @IBOutlet weak var seasonGOTDetailed: UILabel!
  
  @IBOutlet weak var runtimeDetailed: UILabel!
  
  @IBOutlet weak var airdateDetailed: UILabel!
  
  @IBOutlet weak var episodeDescriptionDetailed: UITextView!
  
  @IBOutlet weak var episodeGOTDetailed: UILabel!
  
  var episode: GOTEpisode?
  //outlets
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getEpisodeInfo()
  }
  
  //    func to update episode 
  func getEpisodeInfo(){
    imageViewGOTDetailed.image = UIImage(named:episode?.mediumImageID ?? "")
    episodeTitleDetailedView.text = episode?.name
    seasonGOTDetailed.text = ("Season: \(episode?.season ?? 0)")
    episodeGOTDetailed.text = ("Episode: \(episode?.number ?? 0)")
    runtimeDetailed.text = ("Airtime: \(episode?.runtime ?? 0)")
    airdateDetailed.text = ("Airdate: \(episode?.airdate ?? " ")")
    episodeDescriptionDetailed.text = episode?.summary
  }
  
  
}
