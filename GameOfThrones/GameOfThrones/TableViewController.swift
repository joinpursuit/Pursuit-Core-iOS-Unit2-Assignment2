//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let gotMatrix : [[GOTEpisode]] = GOTEpisode.gotMatrixBySeason()

    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    tableView.dataSource = self
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationReference = segue.destination as? DetailedViewController, let indexPath = tableView.indexPathForSelectedRow else{
            return
        }
        destinationReference.currentEpisode = gotMatrix[indexPath.section][indexPath.row]
    }


}

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

        let xCell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath)

        xCell.textLabel?.text = gotMatrix[indexPath.section][indexPath.row].name
        xCell.detailTextLabel?.text = "S:\(gotMatrix[indexPath.section][indexPath.row].season) E:\(gotMatrix[indexPath.section][indexPath.row].number)"
            xCell.imageView?.image = UIImage(named:gotMatrix[indexPath.section][indexPath.row].mediumImageID)
        return xCell

        }
        
        return UITableViewCell()

    }
}

