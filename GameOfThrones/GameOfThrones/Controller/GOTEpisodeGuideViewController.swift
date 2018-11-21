//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTEpisodeGuideViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var episodesBySeason = [[GOTEpisode]]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        episodesBySeason = seperateBySeason(allEpisodes: GOTEpisode.allEpisodes, totalSeasons: 7)
        print(episodesBySeason.count)
    }
    
    private func seperateBySeason(allEpisodes: [GOTEpisode], totalSeasons: Int) -> [[GOTEpisode]] {
        var output = [[GOTEpisode]]()

        for seasonNum in 1...totalSeasons {
            let currentSeasonEpisodes = allEpisodes.filter { (currentEpisode: GOTEpisode) -> Bool in
                return currentEpisode.number == seasonNum
            }
            output.append(currentSeasonEpisodes)
        }
        return output
    }
    
    //prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
            let GOTEpisodeSummaryController = segue.destination as? GOTEpisodeSummaryController else { return }
        
        let episode = episodesBySeason[indexPath.section][indexPath.row]
        
        GOTEpisodeSummaryController.episode = episode
    }
    


}

extension GOTEpisodeGuideViewController: UITableViewDataSource {
    //# of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodesBySeason.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let seasonNum = section + 1
        return "Season \(seasonNum)"
    }

    //# of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesBySeason[section].count
    }

    //setup row (cell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = episodesBySeason[indexPath.section][indexPath.row]
        
        switch indexPath.section % 2 {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftSideImgCell", for: indexPath) as? leftSideImgCell else { fatalError("cell not found") }
            
            cell.episodeImg.image = UIImage.init(named: episode.mediumImageID)
            cell.episodeTitle.text = episode.name
            cell.seasonAndEpisodeNum.text = "S:\(episode.season)   E:\(episode.number)"
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightSideImgCell", for: indexPath) as? rightSideImgCell else { fatalError("cell not found") }
            
            cell.episodeImg.image = UIImage.init(named: episode.mediumImageID)
            cell.episodeTitle.text = episode.name
            cell.seasonAndEpisodeNum.text = "S:\(episode.season)   E:\(episode.number)"
            return cell
        default:
            fatalError("indexPath.section not found")
        }
    }
    
}

//setup the height for each row
extension GOTEpisodeGuideViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
