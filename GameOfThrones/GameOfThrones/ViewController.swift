//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var gotEpisodes = [[GOTEpisode]]() {
        didSet{
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadData()
    tableView.dataSource = self
    tableView.delegate = self
  }

    func loadData(){
        gotEpisodes = GOTEpisode.getSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDetailVC = segue.destination as? EpisodeDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue is messed up")
        }
        episodeDetailVC.gotEpisode = gotEpisodes[indexPath.section][indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodes[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = gotEpisodes[indexPath.section][indexPath.row]
        
        if episode.season % 2 == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? OddNumberSeasonCell else {
                fatalError("first cell didn't work")
            }
            cell.configureCell(for: episode)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "evenEpisodeCell", for: indexPath) as? EvenNumberCell else {
                fatalError("second cell didn't work")
            }
            cell.configureEvenCells(for: episode)
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotEpisodes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return gotEpisodes[section].first?.season.description
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
}
