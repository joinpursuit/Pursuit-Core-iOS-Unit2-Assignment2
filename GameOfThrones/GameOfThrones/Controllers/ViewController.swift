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
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        return "season 1"
    }
    
    
    
    //variables
    var allEpisodes = GOTEpisode.allEpisodes
    var seasonMatrix = [[GOTEpisode]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTableView.dataSource = self
        showTableView.delegate = self
        
        
        for episode in allEpisodes {
            var season = 1
            seasonMatrix.append(allEpisodes.filter{ $0.season <= season })
            season += 1
            print(seasonMatrix)
        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let indexPath = showTableView.indexPathForSelectedRow, let DisplayView = segue.destination as? DisplayViewController else { return }
       let episode = allEpisodes[indexPath.row]
        DisplayView.episode = episode
    }
}



extension ViewController: UITableViewDataSource{
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = showTableView.dequeueReusableCell(withIdentifier: "GOTviewCell", for: indexPath) as? GOTviewCell else { return UITableViewCell() }
        
        let episodeToSet = allEpisodes[indexPath.row]
        cell.episodeName.text = episodeToSet.name
        cell.GOTimage.image = UIImage(named: episodeToSet.originalImageID)
        cell.seasonAndEpisode.text = episodeToSet.se
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
