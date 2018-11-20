//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var allSeasons = GOTEpisode.allEpisodes
    
    var seasonOne = [GOTEpisode]()
    var seasonTwo = [GOTEpisode]()
    var seasonThree = [GOTEpisode]()
    var seasonFour = [GOTEpisode]()
    var seasonFive = [GOTEpisode]()
    var seasonSix = [GOTEpisode]()
    var seasonSeven = [GOTEpisode]()
    var allMySeason = [[GOTEpisode]]()
    
    @IBOutlet weak var myUITableView: UITableView!
    var movies = GOTEpisode.allEpisodes
    
        override func viewDidLoad() {
    super.viewDidLoad()
            myUITableView.delegate = self
            myUITableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
            
            
            
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
            
allMySeason =   [seasonOne,seasonTwo,seasonThree,seasonFour,seasonFive,seasonSix,seasonSeven]
            
              }

   
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSeasons.count
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 != 0 {
            
        guard let myCell = myUITableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? GOTTableViewLeftCell else {return UITableViewCell()}
        
        let movieToDisplay = movies[indexPath.row]
    
        myCell.GOTLeftSeasonTitle.text = movieToDisplay.name
        myCell.LeftSeasonNumberAndEpisode.text = "S: \(movieToDisplay.season) E: \(movieToDisplay.number)"
        return myCell
        } else {
            guard let myCell = myUITableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? GOTTableViewRightCell else {return UITableViewCell()}
            
            let movieToDisplay = movies[indexPath.row]
            
            myCell.GOTRightSeasonTitle.text = movieToDisplay.name
            myCell.RightSeasonNumberAndEpisode.text = "S: \(movieToDisplay.season) E: \(movieToDisplay.number)"
            return myCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return
            allMySeason.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let myTitle =
        return allMySeason[section][]
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
