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
   
    private var episodes = GOTEpisode.allEpisodes

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
         
   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let gotDetailViewController = segue.destination as? gotViewController else {return}
        let episode = episodes[indexPath.row]
        gotDetailViewController.episode = episode
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameofThronesCell", for: indexPath) as? gotcellTableViewCell else {fatalError("got Cell nop found")}
        let episode = episodes[indexPath.row]
        cell.gotImage.image = UIImage(named: episode.mediumImageID)
        cell.gotName.text = episode.name
        cell.Season.text = "S:  \(episode.season) E: \(episode.number)"
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
