//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var episodes = GOTEpisode.allEpisodes
    
    @IBOutlet weak var introTableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    introTableView.dataSource = self
 
  }

}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = introTableView.dequeueReusableCell(withIdentifier: "introToEpisodeCell", for: indexPath) as? introEpisodeTableViewCell else { return UITableViewCell() }
        
        let episodeForCell = episodes[indexPath.row]
        
        return cell
    }
}

