//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var allSeasons = GOTEpisode.allEpisodes
    
    var seasonOne = [GOTEpisode]()
    var seasonTwo = [GOTEpisode]()
    var seasonThree = [GOTEpisode]()
    var seasonFour = [GOTEpisode]()
    var seasonFive = [GOTEpisode]()
    var seasonSix = [GOTEpisode]()
    var seasonSeven = [GOTEpisode]()
    
    private var allMySeasons = [[GOTEpisode]]() {
        didSet{
            myUITableView.reloadData()
        }
    }
    
    @IBOutlet weak var myUITableView: UITableView!
    
    fileprivate func setUpProtocols(){
        myUITableView.delegate = self
        myUITableView.dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProtocols()
        
        for episode in allSeasons {
            if episode.season == 1{
                seasonOne.append(episode)
            } else{
                if episode.season == 2{
                    seasonTwo.append(episode)
                } else if episode.season == 3 {
                    seasonThree.append(episode)
                } else  if episode.season == 4 {
                    seasonFour.append(episode)
                } else if episode.season == 5 {
                    seasonFive.append(episode)
                } else if episode.season == 6 {
                    seasonSix.append(episode)
                } else if episode.season == 7 {
                    seasonSeven.append(episode)
                }
            }
        }
        
        allMySeasons =   [seasonOne,seasonTwo,seasonThree,seasonFour,seasonFive,seasonSix,seasonSeven]
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMySeasons[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 != 0 {
            
            guard let myCell = myUITableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? GOTTableViewLeftCell else {return UITableViewCell()}
            
            let season = allMySeasons[indexPath.section]
            let episodeToDisplay = season[indexPath.row]
            
            myCell.GOTLeftSeasonTitle.text = episodeToDisplay.name
            myCell.LeftSeasonNumberAndEpisode.text = "S: \(episodeToDisplay.season) E: \(episodeToDisplay.number)"
            myCell.myLeftEpisodeImage.image = UIImage(named: episodeToDisplay.mediumImageID)
            return myCell
        } else {
            guard let myCell = myUITableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? GOTTableViewRightCell else {return UITableViewCell()}
            
            
            let season = allMySeasons[indexPath.section]
            let episodeToDisplay = season[indexPath.row]
            
            myCell.GOTRightSeasonTitle.text = episodeToDisplay.name
            myCell.RightSeasonNumberAndEpisode.text = "S: \(episodeToDisplay.season) E: \(episodeToDisplay.number)"
            myCell.myRightEpisodeImage.image = UIImage(named: episodeToDisplay.mediumImageID)
            return myCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return
            allMySeasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Season \(allMySeasons[section][section].season)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let myIndexPath = myUITableView.indexPathForSelectedRow, let details = segue.destination as? DetailedGOTViewController else {return}
       let movie = allMySeasons[myIndexPath.section][myIndexPath.row]
        details.currentMovie = movie
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
}


