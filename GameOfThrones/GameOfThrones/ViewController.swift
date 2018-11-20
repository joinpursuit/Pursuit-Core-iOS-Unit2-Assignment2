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
   
    private var episodes = GOTEpisode.allEpisodes
    var theSeasons = [GOTEpisode.allEpisodes.filter {$0.season == 1},
                      GOTEpisode.allEpisodes.filter {$0.season == 2},
                      GOTEpisode.allEpisodes.filter {$0.season == 3},
                      GOTEpisode.allEpisodes.filter {$0.season == 4},
                      GOTEpisode.allEpisodes.filter {$0.season == 5},
                      GOTEpisode.allEpisodes.filter {$0.season == 6},
                      GOTEpisode.allEpisodes.filter {$0.season == 7}]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
   }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let gotDetailViewController = segue.destination as? gotViewController else {return}
        let episode = episodes[indexPath.row]
        gotDetailViewController.episode = episode
    }
}
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSeasons[section].count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
            switch section{
                    case 1,3,5,7:
                        header.textLabel?.textAlignment = NSTextAlignment.right
                    default:
                        header.textLabel?.textAlignment = NSTextAlignment.left
                    }
              }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let seasonNumber = indexPath.section
        let season = theSeasons[seasonNumber]
        let theEpisode = season[indexPath.row]
        var safeCell = UITableViewCell()
        if theEpisode.season % 2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameofThronesSecond", for: indexPath) as? gotcellTableViewCell else {fatalError("got Cell nop found")}
            cell.gotImage.image = UIImage(named: theEpisode.mediumImageID)
            cell.gotName.text = theEpisode.name
            cell.Season.text = "S:  \(theEpisode.season) E: \(theEpisode.number)"
            return cell
        } else if theEpisode.season % 2 != 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameofThronesCell", for: indexPath) as? gotcellTableViewCell else {fatalError("GOT cell not found")}
            cell.gotImage.image = UIImage(named: theEpisode.mediumImageID)
            cell.gotName.text = theEpisode.name
            cell.Season.text = "S: \(theEpisode.season) E: \(theEpisode.number)"
            safeCell = cell
        }
          return safeCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return theSeasons.count
    }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Season \(section + 1)"
            
        }
    }
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
   }
        
}

