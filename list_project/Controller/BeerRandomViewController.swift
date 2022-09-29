//
//  BeerRandomViewController.swift
//  list_project
//
//  Created by Luca Chaboissier on 29/09/2022.
//

import Foundation
import UIKit

class BeerRandomViewController: UIViewController {
    //@ibaction func randomize
    
    //MARK: Variables
        var beers: [Beer] = []
        
        var secondsRemaining = 2.0
    
    //MARK: Outlets
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    //MARK: LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            BeerApi.getBeers().done(on: .main, {response in
                self.beers = response
                self.randomize()
            })
        }
    
    //MARK: Functions

    func randomize() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            (Timer) in
            if self.secondsRemaining > 0 {
                let beer = self.getRandomBeer()
                self.titleLabel.text = beer.name
                if let url = URL(string: beer.pictureUrl), let imgData = try? Data(contentsOf: url) {
                    let image = UIImage(data: imgData)
                    self.pictureImageView.image = image
                }
                self.secondsRemaining -= 0.1
            } else {
                Timer.invalidate()
            }
        }
    }

    func getRandomBeer() -> Beer {
        let randomIndex = Int.random(in: 0...(self.beers.count - 1))
        return self.beers[randomIndex]
    }
}

