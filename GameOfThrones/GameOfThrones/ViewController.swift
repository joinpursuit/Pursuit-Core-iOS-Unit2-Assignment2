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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("test test test")
        tableView.delegate = self
        tableView.dataSource = self
//        searchBar.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailedGOTController = segue.destination as? DetailedGOTController else {return}
        
        let currentEpisode = allEpisodes[indexPath.row]
        detailedGOTController.episode = currentEpisode
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentEpisode = allEpisodes[indexPath.row]
        var finalCell = UITableViewCell()
        
        if currentEpisode.season % 2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCellTwo", for: indexPath) as? CustomDisplayCell else {fatalError("GOTCellTwo not found")}
            cell.gOTImage.image = UIImage(named: currentEpisode.mediumImageID)
            cell.episodeName.text = currentEpisode.name
            cell.seasonEpisode.text = "Season: \(currentEpisode.season). Episode: \(currentEpisode.number)"
            finalCell = cell
            
        } else if currentEpisode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? CustomDisplayCell else {fatalError("GOTCell not found")}
            
            cell.gOTImage.image = UIImage(named: currentEpisode.mediumImageID)
            cell.episodeName.text = currentEpisode.name
            cell.seasonEpisode.text = "S: \(currentEpisode.season). Episode: \(currentEpisode.number)"
            finalCell = cell
        }
        
        return finalCell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var allTitles: [String] = ["Season One", "Season Two", "Season Three", "Season Four", "Season Five", "Season Six"]
        return allTitles[section]
        
//        switch allEpisodes[section].season {
//        case 1:
//            return "Season One"
//        case 2:
//            return "Season Two"
//        case 3:
//            return "Season Three"
//        case 4:
//            return "Season Four"
//        case 5:
//            return "Season Five"
//        case 6:
//            return "Season Six"
//        default:
//            return "invalid"
//        }
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //why 100?
    }
}
//
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

//    if currentEpisode.season % 2 == 0{
//
//    stringForTitle = "Section \(currentEpisode.season)"
//
//    } else if currentEpisode.season % 2 != 0 {
//
//    stringForTitle = "Section \(currentEpisode.season)"
//    }
//    return stringForTitle
//}
