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
    var seasons = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entireGOT.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? GOTViewCell else {return UITableViewCell()}
        let episodeToSet = entireGOT[indexPath.row]
        cell.gotImage.image = UIImage(named: episodeToSet.mediumImageID)
        cell.gotTitle.text = episodeToSet.name
        cell.gotInfo.text = "Season: \(episodeToSet.season) Episode: \(episodeToSet.number)"
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Season \(section)"
        case 1:
            return "Season \(section)"
        case 2:
            return "Season \(section)"
        case 3:
            return "Season \(section)"
        case 4:
            return "Season \(section)"
        case 5:
            return "Season \(section)"
        case 6:
            return "Season \(section)"
        case 7:
            return "Season \(section)"
        default:
        return "Testing"
        }
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
