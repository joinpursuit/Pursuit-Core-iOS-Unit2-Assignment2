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
@IBOutlet weak var searchBat: UISearchBar!
  
    private var refreshControl: UIRefreshControl!
    private var episodes = GOTEpisode.allEpisodes {
        didSet {
            tableView.reloadData()
        }
    }
    
    @objc private func fetchEpisodes() {
        refreshControl.endRefreshing()
        arrOfSeasons = filterSeason()
    }
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchEpisodes), for: .valueChanged)
    }
   
    var arrOfSeasons = [[GOTEpisode]]() {
        didSet{
            tableView.reloadData()
        }
    }
        
    private func filterSeason () -> [[GOTEpisode]] {
        arrOfSeasons = [GOTEpisode.allEpisodes.filter{$0.season == 1}, GOTEpisode.allEpisodes.filter{$0.season == 2},GOTEpisode.allEpisodes.filter{$0.season == 3},GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5},GOTEpisode.allEpisodes.filter{$0.season == 6}, GOTEpisode.allEpisodes.filter{$0.season == 7}]
        return arrOfSeasons
    }
  
 
   
        override func viewDidLoad() {
    super.viewDidLoad()
          arrOfSeasons = filterSeason()
      tableView.delegate = self
            tableView.dataSource = self
            searchBat.delegate = self
            setupRefreshControl()
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let indexPath = tableView.indexPathForSelectedRow,
        let detailedViewController = segue.destination as? DetailedViewController else {return}
        
        let theEpisodes = arrOfSeasons[indexPath.section][indexPath.row]
        detailedViewController.episode = theEpisodes
    }
}

extension GOTViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfSeasons[section].count // seasonArr[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = arrOfSeasons[indexPath.section][indexPath.row]
        var resultCell = UITableViewCell()
        if episode.season % 2 == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameThronesCellTwo", for: indexPath) as? CustomCell else {fatalError("GOT cell not found")}
       // let episode = episodes[indexPath.row]
        cell.GOTImage.image = UIImage(named: episode.mediumImageID)
        cell.episodeName.text = episode.name
        cell.seasonEpisode.text = "S\(episode.season) E: \(episode.number)"
        resultCell = cell
    } else if episode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTcell", for: indexPath) as? CustomCell else {fatalError("GOT cell not found")}
      //      let episode = arrOfSeasons[indexPath.section][indexPath.row]
            cell.GOTImage.image = UIImage(named: episode.mediumImageID)
            cell.episodeName.text = episode.name
            cell.seasonEpisode.text = "S\(episode.season) E: \(episode.number)"
            resultCell = cell

    }
        return resultCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfSeasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return "Season \(section + 1)"
    }

}
extension GOTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension GOTViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBat.resignFirstResponder()
        guard let searchText = searchBat.text else { return }
       var emptyArray = [[GOTEpisode]]()
        for season in arrOfSeasons {
            for epi in season {
                if epi.name.lowercased().contains(searchText.lowercased()) {
                    emptyArray.append([epi])
                }
            }
        }
        arrOfSeasons = emptyArray
}
}
