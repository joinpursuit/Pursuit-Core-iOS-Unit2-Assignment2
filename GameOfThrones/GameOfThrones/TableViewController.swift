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
    tableView.delegate = self
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationReference = segue.destination as? DetailedViewController, let indexPath = tableView.indexPathForSelectedRow else{
            return
        }
        destinationReference.currentEpisode = gotMatrix[indexPath.section][indexPath.row]
    }


}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayStoryboard = UIStoryboard(name: "SecondaryStoryboardFile" , bundle: nil)
        let displayVC = displayStoryboard.instantiateViewController(withIdentifier: "detailedViewController") as! DetailedViewController
        displayVC.currentEpisode = gotMatrix[indexPath.section][indexPath.row]
        navigationController?.pushViewController(displayVC, animated: true)
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

            if let xCell = tableView.dequeueReusableCell(withIdentifier: "secondCustomCell", for: indexPath) as? SecondCustomTableViewCell {
                xCell.setUp(gotMatrix[indexPath.section][indexPath.row])
                return xCell
            }
        }
        
        return UITableViewCell()

    }
}

