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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = places[indexPath.row]
        cell.imageView?.image = UIImage(named: places[indexPath.row])
        return cell
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
