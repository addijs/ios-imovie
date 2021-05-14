//
//  ViewController.swift
//  iMovie
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var database: Database!
    @IBOutlet weak var lbCount: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.database = (UIApplication.shared.delegate as! AppDelegate).database
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.lbCount.text = String(self.database.count())
        
        let movies = self.database.getMovies()
        print(movies)
    }
}

