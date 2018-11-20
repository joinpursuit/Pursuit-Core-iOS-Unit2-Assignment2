//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var episodes = GOTEpisode.allEpisodes
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    searchBar.delegate = self
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let summaryViewController = segue.destination as? SummaryViewController else {return}
        let episode = episodes[indexPath.row]
        summaryViewController.episode = episode
    }
}

extension EpisodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellString = "EpisodeCell"
        
        if episodes[indexPath.row].season % 2 == 0 {
            cellString = "EpisodeCellTwo"
        } else {
            cellString = "EpisodeCell"
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellString, for: indexPath) as? showCellTableViewCell else {
            return UITableViewCell()
        }
        let episodeToSet = episodes[indexPath.row]
        cell.episodeName.text = episodeToSet.name
        cell.seasonAndEpisodeLabel.text = "S:\(episodeToSet.season) E:\(episodeToSet.number)"
        cell.episodeImage.image = UIImage(named: episodeToSet.mediumImageID)
        return cell
    }
 
}

extension EpisodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension EpisodeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else { return }
        episodes = GOTEpisode.allEpisodes.filter {$0.name.lowercased().contains(searchText.lowercased())}
    }
}
