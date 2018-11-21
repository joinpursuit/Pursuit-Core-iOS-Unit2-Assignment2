//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var showTableView: UITableView!
    
    //sections:
    //changes the name of the section
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        return "Season \(section + 1)"
    }
    //creates sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //variables
    var allEpisodes = GOTEpisode.allEpisodes
    var seasonMatrix = [[GOTEpisode]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTableView.dataSource = self
        showTableView.delegate = self
        
        //creates a  matrix of seasons
        for season in 1...7 {
            seasonMatrix.append(allEpisodes.filter{ $0.season == season })
        }
        print(seasonMatrix.count)
    }
    
    //prepares the second view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let indexPath = showTableView.indexPathForSelectedRow, let DisplayView = segue.destination as? DisplayViewController else { return }
       let episode = allEpisodes[indexPath.row]
        DisplayView.episode = episode
    }
}



extension ViewController: UITableViewDataSource{
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return seasonMatrix[section].count
    }
    
    //cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episodeToSet = seasonMatrix[indexPath.section][indexPath.row]
        
        if indexPath.section % 2 == 0 {
        guard let cell = showTableView.dequeueReusableCell(withIdentifier: "GOTviewCell", for: indexPath) as? GOTviewCell else { return UITableViewCell() }
        
        
        cell.episodeName.text = episodeToSet.name
        cell.GOTimage.image = UIImage(named: episodeToSet.originalImageID)
        cell.seasonAndEpisode.text = episodeToSet.se
        return cell
        } else {
            guard let cell = showTableView.dequeueReusableCell(withIdentifier: "GOTviewCell2", for: indexPath) as? GOTviewCell else { return UITableViewCell() }
            
            
            cell.episodeName.text = episodeToSet.name
            cell.GOTimage.image = UIImage(named: episodeToSet.originalImageID)
            cell.seasonAndEpisode.text = episodeToSet.se
            return cell
            
        }
    }
    
}
//changes the height of my cells
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
