//
//  SignUp.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit
import Firebase

class SignUp: UIViewController {

    
    @IBOutlet weak var logInOutlet: UIButton!
    @IBOutlet weak var emailUser: UITextField!
    @IBOutlet weak var errorEmailOrPass: UILabel!
    @IBOutlet weak var passUser: UITextField!
    
    private var isValidEmail = false {didSet {updateLogInBtn()}}
    private var isCheckPass = false {didSet {updateLogInBtn()}}
    
    @IBAction func GoToRegistr() {
        
        if let newViewController = storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController {
            newViewController.modalPresentationStyle = .overCurrentContext
            present(newViewController, animated: true, completion: nil)
        }
        
//        if let newViewController = storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController {
//            newViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
//            newViewController.modalPresentationStyle = .overCurrentContext // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
//            present(newViewController, animated: true, completion: nil)
//           }
    }
    
    
    @IBAction func emailAction(_ sender: UITextField) {
        if let email = sender.text, !email.isEmpty,
            VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
    }
    
    
    @IBAction func passAction(_ sender: UITextField) {
        if let passText = sender.text, !passText.isEmpty {
            isCheckPass = true
        } else {
            isCheckPass = false
        }
    }
    
    
    @IBAction func logInToSystem() {
        Auth.auth().signIn(withEmail: emailUser.text!, password: passUser.text!) { (result, error) in
            if error != nil {
                self.errorEmailOrPass.isHidden = true
            } else {
                // go to app screen
            }
        }
    }
    
    
    private func updateLogInBtn () {
        logInOutlet.isEnabled = isValidEmail && isCheckPass
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    



}
