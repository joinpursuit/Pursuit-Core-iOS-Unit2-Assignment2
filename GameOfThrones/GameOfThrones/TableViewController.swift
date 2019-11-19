//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: ViewController Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: ViewController Properties
    var gotMatrix : [[GOTEpisode]] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    var userQuery: String = "" {
        didSet {
            gotMatrix = GOTEpisode.gotMatrixBySeason(searchContents)
        }
    }
    var searchContents: [GOTEpisode] {
        guard let criteria = searchBar.scopeButtonTitles else {
            fatalError("Could not obtain criteria")
        }
        
        switch criteria[searchBar.selectedScopeButtonIndex]{
        case "Name":
            return GOTEpisode.allEpisodes.filter { $0.name.contains(userQuery)}
        case "Summary":
            return GOTEpisode.allEpisodes.filter { $0.summary.contains(userQuery)}
        case "Season":
            return GOTEpisode.allEpisodes.filter {$0.season.description == userQuery}
        default:
            return []
        }
        
    }
    
    // MARK: UIViewController Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        loadMatrix()
    }
    
    // MARK: Helper Methods
    private func loadMatrix(){
        gotMatrix = GOTEpisode.gotMatrixBySeason(GOTEpisode.allEpisodes)
    }
    
}

// MARK: UITableViewDelegate Methods

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayStoryboard = UIStoryboard(name: "SecondaryStoryboardFile" , bundle: nil)
        let displayVC = displayStoryboard.instantiateViewController(withIdentifier: "detailedViewController") as! DetailedViewController
        displayVC.currentEpisode = gotMatrix[indexPath.section][indexPath.row]
        navigationController?.pushViewController(displayVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: UITableViewDataSource Methods

extension TableViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotMatrix.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotMatrix[section][0].season)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotMatrix[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section % 2 == 0{
            if let xCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell{
                xCell.setUp(gotMatrix[indexPath.section][indexPath.row])
                return xCell
            }
        } else {
            if let xCell = tableView.dequeueReusableCell(withIdentifier: "secondCustomCell", for: indexPath) as? SecondCustomTableViewCell {
                xCell.setUp(gotMatrix[indexPath.section][indexPath.row])
                return xCell
            }
        }
        return UITableViewCell()
    }
}

// MARK: UISearchBar Delegate Methods

extension TableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        userQuery = searchText
    }
    
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        guard let text = searchBar.text else {
    //            fatalError("Found a value of nil while unwrapping searchBar text.")
    //        }
    //        userQuery = text
    //    }
}
