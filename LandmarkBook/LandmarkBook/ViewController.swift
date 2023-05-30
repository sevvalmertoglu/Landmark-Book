//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Şevval Mertoğlu on 13.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Clock Tower")
        landmarkNames.append("Colleseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlinn")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "clocktower.jpeg")!)
        landmarkImages.append(UIImage(named: "colesseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatWall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlinn.jpeg")!)
        landmarkImages.append(UIImage(named: "Stonehenge.jpeg")!)
        landmarkImages.append(UIImage(named: "Taj_Mahal_.jpeg")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }//It asks how many entries there will be.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test" //old method
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }// It asks what to show.
    //If we want to use tableview, it is necessary to use these two functions.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]//Equal to whichever is selected in the cell, It means
        performSegue(withIdentifier: "toDetailsVC", sender: nil) //This function asks what to do when a row of the cell is selected
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC //The ViewController I want to go is DetailsVC.
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row )
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)//I used it to delete the selected row in the tableview.
        }
    }
    
    
}



