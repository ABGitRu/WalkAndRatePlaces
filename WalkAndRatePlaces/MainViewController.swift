//
//  MainViewController.swift
//  WalkAndRatePlaces
//
//  Created by Mac on 13.04.2020.
//  Copyright © 2020 Alexey Barinov. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    
    let places = ["Place1","Place2","Place3","Place4","Place5",]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = places[indexPath.row]
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
