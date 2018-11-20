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
    
    private var refreshControl: UIRefreshControl!
    
    var seasonMatrix = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func filterBySeasons() -> [[GOTEpisode]] {
        seasonMatrix = [GOTEpisode.allEpisodes.filter {$0.season == 1},
                        GOTEpisode.allEpisodes.filter {$0.season == 2},
                        GOTEpisode.allEpisodes.filter {$0.season == 3},
                        GOTEpisode.allEpisodes.filter {$0.season == 4},
                        GOTEpisode.allEpisodes.filter {$0.season == 5},
                        GOTEpisode.allEpisodes.filter {$0.season == 6},
                        GOTEpisode.allEpisodes.filter {$0.season == 7}]
        return seasonMatrix
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    seasonMatrix = filterBySeasons()
    tableView.dataSource = self
    tableView.delegate = self
    searchBar.delegate = self
    setupRefreshControl()
  }
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchEpisodes), for: .valueChanged)
    }
    
    @objc private func fetchEpisodes() {
        refreshControl.endRefreshing()
        seasonMatrix = filterBySeasons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let summaryViewController = segue.destination as? SummaryViewController else {return}
        let episode = seasonMatrix[indexPath.section][indexPath.row]
        summaryViewController.episode = episode
    }
}

extension EpisodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonMatrix[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellName = ""
        if seasonMatrix[indexPath.section][indexPath.row].season % 2 == 0 {
            cellName = "EpisodeCellTwo"
        } else {
            cellName = "EpisodeCell"
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? showCellTableViewCell else {
            return UITableViewCell()
        }
        let episodeToSet = seasonMatrix[indexPath.section][indexPath.row]
        cell.episodeName.text = episodeToSet.name
        cell.seasonAndEpisodeLabel.text = "S:\(episodeToSet.season) E:\(episodeToSet.number)"
        cell.episodeImage.image = UIImage(named: episodeToSet.mediumImageID)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasonMatrix.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
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
        var newArr = [[GOTEpisode]]()
        for seasons in seasonMatrix {
            for episodes in seasons {
                if episodes.name.lowercased().contains(searchText.lowercased()) {
                    newArr.append([episodes])
                }
            }
        }
        seasonMatrix = newArr
        
    }
}

