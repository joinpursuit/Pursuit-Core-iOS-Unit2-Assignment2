//
//  EvenSeasonCell.swift
//  GameOfThrones
//
//  Created by Jane Zhu on 11/18/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EvenSeasonCell: UITableViewCell {
    
    @IBOutlet weak var evenEpImage: UIImageView!
    @IBOutlet weak var evenEpName: UILabel!
    @IBOutlet weak var evenSeasonAndEp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
