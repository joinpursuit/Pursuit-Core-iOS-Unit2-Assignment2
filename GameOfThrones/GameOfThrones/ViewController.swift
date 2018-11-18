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
    
    private var episodes = GOTEpisode.getEps()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OddSeasonCell", for: indexPath) as? OddSeasonCell else { fatalError("odd season cell not found") }
        cell.oddEpImage.image = UIImage(named: episode.originalImageID)
        cell.oddEpName.text = episode.name
        cell.oddSeasonAndEp.text = episode.seasonAndEp
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EvenSeasonCell", for: indexPath) as? EvenSeasonCell else { fatalError("odd season cell not found") }
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
