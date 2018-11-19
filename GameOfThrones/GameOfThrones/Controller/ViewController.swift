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
    private var episodes: [GOTEpisode] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    @objc private func fetchEpisodes() {
        refreshControl.endRefreshing()
        episodes = GOTEpisode.getEps()
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
    episodes = GOTEpisode.getEps()
    setUpProtocol()
    setupRefreshControl()
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let DetailViewController = segue.destination as? DetailViewController else { return }
        let episode = episodes[indexPath.row]
        DetailViewController.episode = episode
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = episodes[indexPath.row]
        if episode.season % 2 == 1 {
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
        episodes = GOTEpisode.getEps().filter{ $0.name.lowercased().contains(searchText.lowercased()) } // $0.summary.lowercased().contains(searchText.lowercased())
    }
}
