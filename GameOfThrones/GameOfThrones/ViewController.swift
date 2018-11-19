//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameOfThronesEpisodes = [GOTEpisode.allEpisodes]
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        let seasonOne = GOTEpisode.allEpisodes.filter {$0.season == 1}
        let seasonTwo = GOTEpisode.allEpisodes.filter {$0.season == 2}
        let seasonThree = GOTEpisode.allEpisodes.filter {$0.season == 3}
        let seasonFour = GOTEpisode.allEpisodes.filter {$0.season == 4}
        let seasonFive = GOTEpisode.allEpisodes.filter {$0.season == 5}
        let seasonSix = GOTEpisode.allEpisodes.filter {$0.season == 6}
        let seasonSeven = GOTEpisode.allEpisodes.filter {$0.season == 7}


        self.gameOfThronesEpisodes = [seasonOne, seasonTwo, seasonThree, seasonFour, seasonFive, seasonSix, seasonSeven]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = myTableView.indexPathForSelectedRow,
            let episodeDetailViewController = segue.destination as? EpisodeDetailController else {return}
        let episode = gameOfThronesEpisodes[indexPath.section][indexPath.row]
        episodeDetailViewController.episode = episode
        
    }
    
}

//this extendion is just for the table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
}
extension ViewController: UITableViewDataSource{
    //this function sets up how many rose the tableview has
    //it needs to return that number!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gameOfThronesEpisodes[section].count
    }
    
    
    //sets up the cell inside the row
    //happens as many times as there are rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeCell
            else { fatalError("error getting episode cell") }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        let episodeToSetUP = gameOfThronesEpisodes[indexPath.section][indexPath.row]
        let episodeImage: UIImage = UIImage(named: episodeToSetUP.mediumImageID)!
        
        cell.episodeImage.image = episodeImage
        cell.episodeName.text = episodeToSetUP.name
        cell.episodeInfo.text = "S:\(indexPath.section + 1) E: \(indexPath.row + 1)"
//        cell.textLabel?.text = episodeToSetUP.name
//        cell.imageView?.image = episodeImage
//        cell.detailTextLabel?.text = "S:\(indexPath.section + 1) E: \(indexPath.row + 1)"
        if indexPath.section % 2 != 0 {
            print(indexPath.section)
//            cell.episodeImage.autoPinEdge(.top, to: .bottom, of: tableView, withOffset: 16.0)
            cell.backgroundColor = .gray
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return gameOfThronesEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Season 1"
        case 1:
            return "Season 2"
        case 2:
            return "Season 3"
        case 3:
            return "Season 4"
        case 4:
            return "Season 5"
        case 5:
            return "Season 6"
        case 6:
            return "Season 7"
        default:
            return "Unknown"
            
        }
    }
}

