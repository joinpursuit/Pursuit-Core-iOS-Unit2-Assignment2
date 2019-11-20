//
//  GOTSectionsViewCell.swift
//  GameOfThrones
//
//  Created by Lilia Yudina on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GOTSectionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var season = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        season = GOTEpisode.seasonSections()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDC = segue.destination as?
            EpisodeViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let episode = season[indexPath.section][indexPath.row]
        episodeDC.episode = episode
    }
}
extension GOTSectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return season[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "gOTCell", for: indexPath) as? EpisodeCell else {              fatalError("Couldn't dequeue a EpisodeCell")
            }
            let episode = season[indexPath.section][indexPath.row]
                   cell.configureCell(for: episode)
                return cell
        } else {
        guard let cellRight = tableView.dequeueReusableCell(withIdentifier: "gOTCell1", for: indexPath) as? EpisodeCellRight else {
            fatalError("Couldn't dequeue a EpisodeCell")
        }
            let episode = season[indexPath.section][indexPath.row]
                   cellRight.configureCell(for: episode)
                   return cellRight
            }
        
            
       
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(season[section].first!.season.description)"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return season.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}


