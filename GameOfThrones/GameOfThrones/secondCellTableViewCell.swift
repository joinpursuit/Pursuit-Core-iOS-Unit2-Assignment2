//
//  secondCellTableViewCell.swift
//  GameOfThrones
//
//  Created by Matthew Huie on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class secondCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeasonAndNumber: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
