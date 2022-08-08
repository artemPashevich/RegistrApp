//
//  LogInViewController.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var ErrorPassword: UILabel!
    
    @IBOutlet weak var ErrorEmail: UILabel!
    
    private var isValidEmail = false
    
    @IBAction func emailUser(_ sender: UITextField) {
        if let email = sender.text, !email.isEmpty,
            VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        ErrorEmail.isHidden = isValidEmail
    }
    
    
    @IBAction func nameUser(_ sender: Any) {
        
    }
    
    
    @IBAction func passwordUser(_ sender: Any) {
        
    }
    
    
    @IBAction func continueBtn(_ sender: Any) {
        
    }
    
    
    @IBAction func switchLogIn(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
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
