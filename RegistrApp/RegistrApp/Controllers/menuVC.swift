//
//  menuVC.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 10.08.22.
//

import UIKit

class menuVC: UIViewController {

    
    
    
    @IBAction func pushEditUser() {
        transition()
    }
    
    func transition() {
        performSegue(withIdentifier: "EditUserData", sender: nil)
    }
     
    
    @IBAction func exitToRegistr(_ sender: Any) {
        tap()
    }
    
    func tap() {
           let storyBoard: UIStoryboard = UIStoryboard(name: "LogIn", bundle: nil)
           let newViewController = storyBoard.instantiateViewController(withIdentifier: "SignUp") as! SignUp
           newViewController.modalPresentationStyle = .fullScreen
           present(newViewController, animated: true, completion: nil)
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
