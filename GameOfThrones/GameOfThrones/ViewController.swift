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
        loadData()
    }
    
    func loadData() {
        movieEpisodes = [GOTEpisode.allEpisodes]
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieEpisodes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: MovieTableViewCell!
        
        if indexPath.section % 2 == 0 {
            guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? MovieTableViewCell else {
                fatalError("We coudn't degueue a rightImageCell")
            }
            cell = movieCell
        } else {
        
        let episode = movieEpisodes[indexPath.section][indexPath.row]
        cell.configureCell(for: episode)
        
        return cell
    }
}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieEpisodes[section].first?.season
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        movieEpisodes.count
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
