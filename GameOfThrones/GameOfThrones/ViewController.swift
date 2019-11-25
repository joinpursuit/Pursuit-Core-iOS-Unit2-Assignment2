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
    
    
    var movieEpisodes = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieEpisodes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? CellsTableViewCell else {
                fatalError("couldn't deque CellsTableViewCell")
            }
            let episode = movieEpisodes[indexPath.section][indexPath.row]
            cell.configureRightCell(for: episode)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? CellsTableViewCell else {
                fatalError("couldn't deque CellsTableViewCell")
            }
            let episode = movieEpisodes[indexPath.section][indexPath.row]
            cell.configureLeftCell(for: episode)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(movieEpisodes[section].first?.season.description ?? "")"
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

