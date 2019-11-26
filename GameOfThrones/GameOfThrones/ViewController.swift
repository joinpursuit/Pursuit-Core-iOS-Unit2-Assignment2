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
        movieEpisodes = GOTEpisode.getSeasonSection() // seasonSection() that we will creat in GOTEpisode.file
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieEpisodes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell: MovieTableViewCell!
        
        if indexPath.section % 2 == 0 {
            guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? MovieTableViewCell else {
                fatalError("We coudn't degueue a rightImageCell")
            }
            let episode = movieEpisodes[indexPath.section][indexPath.row]
            movieCell.configureCell(for: episode)
            return movieCell
        } else {
            guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? MovieTableViewCell else {
                fatalError("We coudn't degueue a leftImageCell")
            }
            let episode = movieEpisodes[indexPath.section][indexPath.row]
            movieCell.configureCell(for: episode)
            return movieCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(movieEpisodes[section].first?.season.description ?? "")"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieEpisodes.count
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
