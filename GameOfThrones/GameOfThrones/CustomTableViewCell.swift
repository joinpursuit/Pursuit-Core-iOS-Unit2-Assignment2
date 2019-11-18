//
//  customTableViewCell.swift
//  GameOfThrones
//
//  Created by Cameron Rivera on 11/15/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var episodePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(_ episode: GOTEpisode){
        titleLabel.text = episode.name
        subLabel.text = "S:\(episode.season) E:\(episode.number)"
        episodePicture.clipsToBounds = true
        episodePicture?.image = UIImage(named:episode.mediumImageID)
    }

}
