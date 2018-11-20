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
    
    private var refreshControl: UIRefreshControl!
    
    
    var gotSeasonArr = [[GOTEpisode]]() {
        didSet{
            tableView.reloadData()
        }
    }
    private func filterSeason () -> [[GOTEpisode]] {
        gotSeasonArr = [GOTEpisode.allEpisodes.filter{$0.season == 1}, GOTEpisode.allEpisodes.filter{$0.season == 2},GOTEpisode.allEpisodes.filter{$0.season == 3},GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5},GOTEpisode.allEpisodes.filter{$0.season == 6}, GOTEpisode.allEpisodes.filter{$0.season == 7}]
        return gotSeasonArr
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    gotSeasonArr = filterSeason()
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
    setupRefreshControl()
  }
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl ()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchGOT), for: .valueChanged)
    }
    
    @objc private func fetchGOT(){
        refreshControl.endRefreshing()
        gotSeasonArr = filterSeason()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let gotDetailViewController = segue.destination as? GotDetailViewController else {return}
        let episode = gotSeasonArr[indexPath.section][indexPath.row] 
        gotDetailViewController.episode = episode
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotSeasonArr[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotSeasonArr.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = gotSeasonArr[indexPath.section][indexPath.row]
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
        return "Season \(section + 1)"
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
        var emptyArray = [[GOTEpisode]]()
        for seasons in gotSeasonArr {
            for episode in seasons{
                if episode.name.lowercased().contains(searchText.lowercased()) {
                
                    emptyArray.append([episode])
                   
                }
            }
        }
        gotSeasonArr = emptyArray
        
    }
}
