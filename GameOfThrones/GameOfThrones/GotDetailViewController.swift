//
//  GotDetailViewController.swift
//  GameOfThrones
//
//  Created by Bienbenido Angeles on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GotDetailViewController: UIViewController {
    @IBOutlet weak var gotDetailImageView: UIImageView!
    @IBOutlet weak var gotNameLabel: UILabel!
    @IBOutlet weak var gotContentDetailLabel: UITextView!
    @IBOutlet weak var gotDescLabel: UITextView!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatedUI()
        // Do any additional setup after loading the view.
    }
    
    func updatedUI(){
        guard let episodeName = episode else {
            fatalError("Couldn't get a GOTEpisode value, verify prepare(for segue: )")
        }
        navigationItem.title = episodeName.name
        gotDetailImageView.image = UIImage(named: episodeName.originalImageID)
        gotNameLabel.text = episodeName.name
        gotContentDetailLabel.text = "Season:  \(episodeName.season)\nEpisode: \(episodeName.number)\nRuntime:  \(episodeName.runtime)\nAirDate: \(episodeName.airdate)"
        gotDescLabel.text = episodeName.summary
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
