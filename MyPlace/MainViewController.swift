//
//  MainViewController.swift
//  MyPlace
//
//  Created by a.koziukin on 22.11.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    let restaurantNames = [
        "Dry'n'Wet", "Roof Bar",
        "Tagiatelle", "More", "ReLab",
        "NaNi", "Casper", "Kontora57",
        "Zero", "Kommunalka Bar", "Top Hop",
        "Sherlock Holmes", "Morris Pub", "X.O"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        return restaurantNames.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            cell.textLabel?.text = restaurantNames[indexPath.row]
            cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
            cell.imageView?.layer.cornerRadius = cell.frame.size.height  / 2
            cell.imageView?.clipsToBounds = true
            
    
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
     

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }


}
