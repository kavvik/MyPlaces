//
//  MainViewController.swift
//  MyPlace
//
//  Created by a.koziukin on 22.11.2022.
//

import UIKit

class MainViewController: UITableViewController {
    

    
    let places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        return places.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell

            cell.nameLabel.text = places[indexPath.row].name
            cell.locationLabel.text = places[indexPath.row].location
            cell.typeLabel.text = places[indexPath.row].type
            cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)      // присвоение картинки
            
            
            cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.height  / 2 // скругление имейдж
            cell.imageOfPlace.clipsToBounds = true
            
    
        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }


}
