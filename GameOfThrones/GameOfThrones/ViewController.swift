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
    
    private var allEpisodes = GOTEpisode.allEpisodes
    
    var arrOfFilteredSeasons = [GOTEpisode.allEpisodes.filter{$0.season == 1},GOTEpisode.allEpisodes.filter{$0.season == 2}, GOTEpisode.allEpisodes.filter{$0.season == 3}, GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5}, GOTEpisode.allEpisodes.filter{$0.season == 6},GOTEpisode.allEpisodes.filter{$0.season == 7} ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //        searchBar.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailedGOTController = segue.destination as? DetailedGOTController else {return}
        
        let currentEpisode = arrOfFilteredSeasons[indexPath.section][indexPath.row]
        detailedGOTController.episode = currentEpisode
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfFilteredSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentEpisode = arrOfFilteredSeasons[indexPath.section][indexPath.row]
        var finalCell = UITableViewCell()
        
        if  currentEpisode.season % 2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCellTwo", for: indexPath) as? CustomDisplayCell else {fatalError("GOTCellTwo not found")}
            cell.gOTImage.image = UIImage(named: currentEpisode.mediumImageID)
            cell.episodeName.text = currentEpisode.name
            cell.seasonEpisode.text = "Season: \(currentEpisode.season). Episode: \(currentEpisode.number)"
            finalCell = cell
            
        } else if currentEpisode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? CustomDisplayCell else {fatalError("GOTCell not found")}
            
            cell.gOTImage.image = UIImage(named: currentEpisode.mediumImageID)
            cell.episodeName.text = currentEpisode.name
            cell.seasonEpisode.text = "Season: \(currentEpisode.season). Episode: \(currentEpisode.number)"
            finalCell = cell
        }
        
        return finalCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfFilteredSeasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ("Season \(section + 1)")
    }
    
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


//extension ViewController: UISearchBarDelegate{
//    //step two implement methods as needed or required if available
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        //dismiss the keyboard - resign
//        searchBar.resignFirstResponder()
//
//        guard let searchText = searchBar.text else {return}
//        //searchBar.text is an optional and we are unwrapping with guard statement
//
//        //user can enter "classic" or "egg"
//        //result should return "Classic Deviled Eggs"
//
//        allEpisodes = GOTEpisode.allEpisodes.filter
//           {$0.name.lowercased().contains(searchText.lowercased())}
//    }
//}

