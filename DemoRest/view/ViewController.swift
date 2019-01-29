//
//  ViewController.swift
//  DemoRest
//
//  Created by mobapp11 on 29/01/2019.
//  Copyright © 2019 mobapp11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var items = [UserPost].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = PostParser.getAllPosts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        
        let touchedCell = sender as! UITableViewCell
        let indexpath = tableview.indexPath(for: touchedCell)
        
        let gekozenPost = items[indexpath!.row]
        destination.post = gekozenPost
        
        
    }
    
    
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let userPostForCell = items[indexPath.row]
        
        cell.textLabel!.text = userPostForCell.title
        
        
        return cell
    }

}
