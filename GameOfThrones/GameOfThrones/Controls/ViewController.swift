//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var episodes = [GOTEpisode]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    var seasonsArr = [GOTEpisode.allEpisodes.filter{$0.season == 1}, GOTEpisode.allEpisodes.filter{$0.season == 2},GOTEpisode.allEpisodes.filter{$0.season == 3},GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5},GOTEpisode.allEpisodes.filter{$0.season == 6}, GOTEpisode.allEpisodes.filter{$0.season == 7}]
    
    override func viewDidLoad() {
    super.viewDidLoad()
    episodes = GOTEpisode.allEpisodes
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
  }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let gotDetailViewController = segue.destination as? GotDetailViewController else {return}
        let episode = seasonsArr[indexPath.section][indexPath.row] 
        gotDetailViewController.episode = episode
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonsArr[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasonsArr.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = seasonsArr[indexPath.section][indexPath.row]
        var resultCell = UITableViewCell()
        if episode.season % 2 == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameOfThronesCell2", for: indexPath) as? GotCellTableViewCell else {fatalError("GOT cell not found")}
        cell.gotImage.image = UIImage(named: episode.mediumImageID)
        cell.gotEpisodeName.text = episode.name
        cell.gotSeasonEpisode.text = "S: \(episode.season) E: \(episode.number)"
            resultCell = cell
        } else if episode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameOfThronesCell", for: indexPath) as? GotCellTableViewCell else {fatalError("GOT cell not found")}
            cell.gotImage.image = UIImage(named: episode.mediumImageID)
            cell.gotEpisodeName.text = episode.name
            cell.gotSeasonEpisode.text = "S: \(episode.season) E: \(episode.number)"
            resultCell = cell
            
        }
        
        return resultCell
    
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return "Rest"
        }
    }
    }


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else {return}
        
        episodes = episodes.filter{$0.name.lowercased().contains(searchText.lowercased())}
    }
}
