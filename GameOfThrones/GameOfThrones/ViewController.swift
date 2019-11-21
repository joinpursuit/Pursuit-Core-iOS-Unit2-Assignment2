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
    
    
    var seasons = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    seasons = GOTEpisode.getSeasonSections()
    tableView.dataSource = self
    tableView.delegate = self
    
    
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? GOTDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        let episode = seasons[indexPath.section][indexPath.row]
        detailViewController.episode = episode
    }

}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstTableViewCell else {
                fatalError("couldn't deque FirstTableViewCell")
            }
            let episode = seasons[indexPath.section][indexPath.row]
            cell.configureFirstCell(for: episode)
            return cell
        } else  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondTableViewCell else {
                fatalError("couldn't deque SecondTableViewCell")
            }
            let episode = seasons[indexPath.section][indexPath.row]
            cell.configureSecondCell(for: episode)
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasons[section].first?.season.description ?? "")"
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
