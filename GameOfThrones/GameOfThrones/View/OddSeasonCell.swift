//
//  OddSeasonCell.swift
//  GameOfThrones
//
//  Created by Jane Zhu on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class OddSeasonCell: UITableViewCell {
    
    @IBOutlet weak var oddEpImage: UIImageView!
    @IBOutlet weak var oddEpName: UILabel!
    @IBOutlet weak var oddSeasonAndEp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
