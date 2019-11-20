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
    
    var gotEpisodes = [[GOTEpisode]](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gotDVC = segue.destination as? GotDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("IndexPath failed to be configured")
        }
        
        gotDVC.episode = gotEpisodes[indexPath.section][indexPath.row]
    }
    
    func loadData(){
        gotEpisodes = GOTEpisode.getSeasons()
    }


}

extension ViewController:UITableViewDataSource{
    
    //data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let leftCell = tableView.dequeueReusableCell(withIdentifier: "leftHandCell", for: indexPath) as? GotCell else {
            fatalError("leftCell failed to deque")
        }
        
        guard let rightCell = tableView.dequeueReusableCell(withIdentifier: "rightHandCell", for: indexPath) as? GotCell else {
            fatalError("rightCell failed to deque")
        }
        
        
        let gotEpisode = gotEpisodes[indexPath.section][indexPath.row]
        if gotEpisode.season % 2 == 0{
            leftCell.configureCell(for: gotEpisode)
            return leftCell
        } else{
            rightCell.configureCell(for: gotEpisode)
            return rightCell
        }
    }
    
    //section methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotEpisodes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotEpisodes[section].first!.season)"
    }
}
