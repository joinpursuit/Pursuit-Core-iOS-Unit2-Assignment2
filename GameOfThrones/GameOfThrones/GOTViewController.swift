//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
   
   private var episodes = GOTEpisode.allEpisodes
  
  
 
   
        override func viewDidLoad() {
    super.viewDidLoad()
      tableView.delegate = self
            tableView.dataSource = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let indexPath = tableView.indexPathForSelectedRow,
        let detailedViewController = segue.destination as? DetailedViewController else {return}
        
        let theEpisodes = episodes[indexPath.row]
        detailedViewController.episode = theEpisodes
    }
}

extension GOTViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = episodes[indexPath.row]
        var resultCell = UITableViewCell()
        if episode.season % 2 == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameThronesCellTwo", for: indexPath) as? CustomCell else {fatalError("GOT cell not found")}
        let episode = episodes[indexPath.row]
        cell.GOTImage.image = UIImage(named: episode.mediumImageID)
        cell.episodeName.text = episode.name
        cell.seasonEpisode.text = "S\(episode.season) E: \(episode.number)"
        resultCell = cell
    } else if episode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTcell", for: indexPath) as? CustomCell else {fatalError("GOT cell not found")}
            let episode = episodes[indexPath.row]
            cell.GOTImage.image = UIImage(named: episode.mediumImageID)
            cell.episodeName.text = episode.name
            cell.seasonEpisode.text = "S\(episode.season) E: \(episode.number)"
            resultCell = cell

    }
        return resultCell
    }



}
extension GOTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
