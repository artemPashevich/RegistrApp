//
//  SignUp.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit

class SignUp: UIViewController {

    
    @IBOutlet weak var errorEmailOrPass: UILabel!
    
    @IBAction func GoToRegistr() {
        performSegue(withIdentifier: "GoToRegistr", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
