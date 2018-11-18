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
    
}

//this extendion is just for the table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section \(indexPath.section), row: \(indexPath.row)")
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
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "dayCell")
        //selected the appropriate string from my days of the week by using the rows indexpath.row
        let episodeToSetUP = gameOfThronesEpisodes[indexPath.section][indexPath.row]
        //set the cells text label to display the string chosen
        cell.textLabel?.text = episodeToSetUP.name
        cell.detailTextLabel?.text = "S:\(indexPath.section + 1) E: \(indexPath.row + 1)"
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

