//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var entireGOT = GOTEpisode.allEpisodes
    @IBOutlet weak var tableView: UITableView!
    var array = [[Any]]()
    var gotSeason: Int? = nil
    var seasonEp = [Int]()
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        for episode in entireGOT {
            let season = episode.season
                if season != gotSeason {
                    array.append([])
                    seasonEp.append(season)
                    gotSeason = season
                }
            array[array.endIndex - 1].append(episode)
        }
        print(seasonEp)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController, let cellSelected = tableView.indexPathForSelectedRow else {return}
        let episodeSelected = entireGOT[cellSelected.row]
        destination.episode = episodeSelected
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellString: String = "tableCell"
        if entireGOT[indexPath.row].season % 2 == 0 {
            cellString = "tableCellTwo"
        } else {
            cellString = "tableCell"
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellString, for: indexPath) as? GOTViewCell else {return UITableViewCell()}
        let episodeToSet = entireGOT[indexPath.row]
        cell.gotImage.image = UIImage(named: episodeToSet.mediumImageID)
        cell.gotTitle.text = episodeToSet.name
        cell.gotInfo.text = "Season: \(episodeToSet.season) Episode: \(episodeToSet.number)"
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasonEp[section])"
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
