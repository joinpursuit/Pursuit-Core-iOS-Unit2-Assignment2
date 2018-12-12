//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var episodes = GOTEpisode.allEpisodes
    var seasonsArray = [GOTEpisode.allEpisodes.filter{$0.season == 1},GOTEpisode.allEpisodes.filter{$0.season == 2}, GOTEpisode.allEpisodes.filter{$0.season == 3}, GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5}, GOTEpisode.allEpisodes.filter{$0.season == 6},GOTEpisode.allEpisodes.filter{$0.season == 7} ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension EpisodeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //sectioning the sections into categories
        let episode = seasonsArray[indexPath.section][indexPath.row]
        if episode.season % 2 != 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? EpisodeCell else { return UITableViewCell() }
        cell.episodeImage.image = UIImage(named: episode.mediumImageID)
        cell.episodeTitle.text = String(episode.name)
        cell.episodeAndSeason.text = String("S: \(episode.season) E: \(episode.number)")
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? EpisodeCell else { return UITableViewCell() }
            cell.episodeImage.image = UIImage(named: episode.mediumImageID)
            cell.episodeTitle.text = String(episode.name)
            cell.episodeAndSeason.text = String("S: \(episode.season) E: \(episode.number)")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonsArray[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasonsArray.count
    }
    //function for making sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \((seasonsArray[section].first?.season)!)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = segue.destination as? DetailViewController,
        let DetailViewController = tableView.indexPathForSelectedRow else { return }
        let episode = episodes[DetailViewController.row]
        indexPath.got = episode
    }
    
}

extension EpisodeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
}

//to flip each cell just use modulo even/odd for the episodes
