//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showTableView: UITableView!
    
    var allEpisodes = GOTEpisode.allEpisodes
    
    var array = [[GOTEpisode]]()
    var gotSeason: Int? = nil
    var seasonEp = [Int]()
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    showTableView.delegate = self
    showTableView.dataSource = self
            array = [GOTEpisode.allEpisodes.filter {$0.season == 1},
                    GOTEpisode.allEpisodes.filter {$0.season == 2},
                    GOTEpisode.allEpisodes.filter {$0.season == 3},
                    GOTEpisode.allEpisodes.filter {$0.season == 4},
                    GOTEpisode.allEpisodes.filter {$0.season == 5},
                    GOTEpisode.allEpisodes.filter {$0.season == 6},
                    GOTEpisode.allEpisodes.filter {$0.season == 7}]
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cellSelected = showTableView.indexPathForSelectedRow ,
            let destination = segue.destination as? EpisodeDetailsViewController else {return}
        
        let episodeSelected = array[cellSelected.section][cellSelected.row]
        destination.episodeN = episodeSelected
    }
   

    
  

}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var evenOrOddSeason: String
        if array[indexPath.section][indexPath.row].season % 2 == 0 {
            evenOrOddSeason = "OddSeason"
        }else {
            evenOrOddSeason = "EvenSeason"
        }
         guard let cell = showTableView.dequeueReusableCell(withIdentifier: evenOrOddSeason, for: indexPath) as? EpisodeCell else {fatalError("Episode cell not found")}
        let episodeInfo = array[indexPath.section][indexPath.row]
        cell.episodeImage.image =  UIImage(named: episodeInfo.mediumImageID)
        cell.title.text = episodeInfo.name
        cell.season.text = ("S:\(episodeInfo.season)")
        cell.episode.text = ("E:\(episodeInfo.number)")
        return cell
            }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                return "Season \(section + 1)"
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
  
    
    }


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

