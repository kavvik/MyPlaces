//
//  MainViewController.swift
//  MyPlace
//
//  Created by a.koziukin on 22.11.2022.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        
        places = realm.objects(Place.self)
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.isEmpty ? 0 : places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.height  / 2 // скругление имейдж
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) ->
    [UITableViewRowAction]? {
        
        let place = places[indexPath.row]
         
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
//    @IBAction func unwindSegue (_ segue: UIStoryboardSegue) {
//
//        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
//
//        newPlaceVC.saveNewPlace()
//        tableView.reloadData()
//    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    //    }
    
    
}

