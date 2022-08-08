//
//  LogInViewController.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    
    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var passUser: UITextField!
    @IBOutlet weak var emailUser: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var ErrorPassword: UILabel!
    
    @IBOutlet weak var ErrorEmail: UILabel!
    
    private var isValidEmail = false { didSet {updateContinueBtn()}}
    private var passwordStrength: PasswordStrength = .veryWeak { didSet {updateContinueBtn()}}
    
    @IBAction func emailUser(_ sender: UITextField)  {
        if let email = sender.text, !email.isEmpty,
            VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        ErrorEmail.isHidden = isValidEmail
    }
    
    
    func addNewUserToBase () {
        Auth.auth().createUser(withEmail: emailUser.text!, password: passUser.text!) { result, error in
            if error == nil {
                if let result = result {
                let ref = Database.database().reference().child("Users")
                    ref.child(result.user.uid).updateChildValues(["Name": self.nameUser.text!, "Email": self.emailUser.text!])
                }
                else {
                    let alertVC = UIAlertController(
                                title: "Error",
                                message: "A user with such an email is already registered",
                                preferredStyle: .alert)
                            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertVC.addAction(action)
                            self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func passwordUser(_ sender: UITextField) {
        if let passText = sender.text, !passText.isEmpty {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        }
        ErrorPassword.isHidden = passwordStrength != .veryWeak
    }
    
    
    @IBAction func continueBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "GoToVerificCod", sender: nil)
        addNewUserToBase()
    }
    
    
    @IBAction func switchLogIn(_ sender: Any) {
        
    }
    
    private func updateContinueBtn () {
        continueBtn.isEnabled = isValidEmail && passwordStrength != .veryWeak
    }
    
    
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
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
