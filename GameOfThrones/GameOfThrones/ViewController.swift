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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? CustomDisplayCell else {fatalError("episode not found")}
        
        let currentEpisode = allEpisodes[indexPath.row]
        cell.gOTImage.image = UIImage(named: currentEpisode.mediumImageID)
        cell.episodeName.text = currentEpisode.name
        cell.seasonEpisode.text = "S: \(currentEpisode.season). Episode: \(currentEpisode.number)"
        
        return cell
    }
    

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

