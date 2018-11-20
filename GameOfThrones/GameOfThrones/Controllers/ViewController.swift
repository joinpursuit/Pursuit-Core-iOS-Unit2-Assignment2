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
    
    
    //variables
    var allEpisodes = GOTEpisode.allEpisodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTableView.dataSource = self
        showTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let DisplayView = segue.destination as? DisplayViewController else { return }
       let episode = allEpisodes[IndexPath.row]
        
        
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
