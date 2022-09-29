//
//  MyNewViewController.swift
//  list_project
//
//  Created by Luca Chaboissier on 29/09/2022.
//

import Foundation
import UIKit

class MyNewViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "image.jpg")
    }
}
