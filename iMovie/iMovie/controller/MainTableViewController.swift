//
//  MainTableViewController.swift
//  iMovie
//
//  Created by IFPB on 21/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var database: Database!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.database = (UIApplication.shared.delegate as! AppDelegate).database
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.addMovies()
    }
    
    func addMovies() {
        self.database.add(movie: Movie(title: "A Origem", timesWatched: 99, rating: 10, isOscarNominated: true))
        
        self.database.add(movie: Movie(title: "O Código Da Vinci", timesWatched: 5, rating: 9, isOscarNominated: true))
        
        self.database.add(movie: Movie(title: "V de Vingança", timesWatched: 9, rating: 9, isOscarNominated: false))
        
        self.database.add(movie: Movie(title: "As Vantagens de Ser Invisível", timesWatched: 3, rating: 10, isOscarNominated: false))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.database.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filme", for: indexPath)
        
        let movie = self.database.get(index: indexPath.row)
        
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = String(movie.rating)

        // Configure the cell...

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.database.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.database.moveItem(from: fromIndexPath.row, to: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let formViewController = self.storyboard?.instantiateViewController(identifier: "form") as! MovieViewController
        
        formViewController.movieToEdit = indexPath.row
        self.navigationController?.pushViewController(formViewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.reloadData()
    }

}
