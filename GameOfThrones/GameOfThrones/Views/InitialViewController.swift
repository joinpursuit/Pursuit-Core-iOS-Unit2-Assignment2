//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    //original:  private var episodes = GOTEpisode.allEpisodes
    private var episodes = GOTEpisode.allEpisodes()
    
    
    @IBOutlet weak var introTableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    introTableView.dataSource = self
    introTableView.delegate = self
 
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? EpisodeViewController,
            let cellSelected = introTableView.indexPathForSelectedRow else { return }
        let episodeSelected = episodes[cellSelected.row]
        destination.gotEpisodes = episodeSelected
    }
    
}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = introTableView.dequeueReusableCell(withIdentifier: "introToEpisodeCell", for: indexPath) as? introEpisodeTableViewCell else { return UITableViewCell() }
        
        let episodeCell = episodes[indexPath.row]
        
        cell.episodeNameLabel.text = episodeCell.name
        
        let secondLabel = ("S" + ":" + "\(episodeCell.season)" + " " + "E" + ":" + "\(episodeCell.number)")
        
        cell.episodeOrderLabel.text = secondLabel
        
//        cell.imageView?.image = episodeCell.image - not working
        
        
    return cell
        }
    }


extension InitialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
