//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Jane Zhu on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var refreshControl: UIRefreshControl!
    private var GOTData: [[GOTEpisode]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @objc private func fetchEpisodes() {
        refreshControl.endRefreshing()
        GOTData = GOTEpisode.getEpsBySeason()
    }
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchEpisodes), for: .valueChanged)
    }
    private func setUpProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    GOTData = GOTEpisode.getEpsBySeason()
    setUpProtocol()
    setupRefreshControl()
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let DetailViewController = segue.destination as? DetailViewController else { return }
        let episode = GOTData[indexPath.section][indexPath.row]
        DetailViewController.episode = episode
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return GOTData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = GOTData[indexPath.section][indexPath.row]
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OddSeasonCell", for: indexPath) as? OddSeasonCell else { fatalError("oddSeasonCell not found") }
            cell.oddEpImage.image = UIImage(named: episode.originalImageID)
            cell.oddEpName.text = episode.name
            cell.oddSeasonAndEp.text = episode.seasonAndEp
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EvenSeasonCell", for: indexPath) as? EvenSeasonCell else { fatalError("evenSeasonCell not found") }
            cell.evenEpImage.image = UIImage(named: episode.originalImageID)
            cell.evenEpName.text = episode.name
            cell.evenSeasonAndEp.text = episode.seasonAndEp
            return cell
        }
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
            return nil
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
        guard let searchText = searchBar.text else { return }
        GOTData = [GOTEpisode.allEpisodes.filter{ $0.name.lowercased().contains(searchText.lowercased()) }]
    }
}
