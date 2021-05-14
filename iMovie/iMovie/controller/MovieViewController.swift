//
//  MovieViewController.swift
//  iMovie
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var database: Database!
    var movie: Movie!
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var switchOscar: UISwitch!
    
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var sliderRating: UISlider!
    @IBAction func sliderValueHasChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        lbRating.text = String(currentValue)
    }
    
    @IBOutlet weak var lbTimes: UILabel!
    @IBOutlet weak var stepperTimes: UIStepper!
    @IBAction func stepperValueHasChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        lbTimes.text = String(currentValue)
    }

    @IBAction func btnSave(_ sender: Any) {
        let title = self.tfTitle.text!
        let rating = Int(self.sliderRating.value)
        let timesWatched = Int(self.stepperTimes.value)
        let isOscarNominated = self.switchOscar.isOn
        
        let movie = Movie(
            title: title,
            timesWatched: timesWatched,
            rating: rating,
            isOscarNominated: isOscarNominated
        )
        
        self.database = (UIApplication.shared.delegate as! AppDelegate).database
        self.database.add(movie: movie)
        
        self.navigationController?.popViewController(animated: true)
    }
}
