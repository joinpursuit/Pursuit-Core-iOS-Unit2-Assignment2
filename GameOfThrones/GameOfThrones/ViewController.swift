//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var myUITableView: UITableView!
    var movies = GOTEpisode.allEpisodes
    
        override func viewDidLoad() {
    super.viewDidLoad()
            myUITableView.delegate = self
            myUITableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
  }

   
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myCell = myUITableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? GOTTableViewLeftCell else {return UITableViewCell()}
        
        let movieToDisplay = movies[indexPath.row]
    
        myCell.GOTLeftSeasonTitle.text = movieToDisplay.name
        myCell.LeftSeasonNumberAndEpisode.text = "S: \(movieToDisplay.season) E: \(movieToDisplay.number)"
        return myCell
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
