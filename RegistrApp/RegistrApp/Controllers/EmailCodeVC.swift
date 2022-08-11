//
//  EmailCodeVC.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit

class EmailCodeVC: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    
    let secretCode = Int.random(in: 100000...999999)
    
    
    func tap() {
        if let newViewController = storyboard?.instantiateViewController(withIdentifier: "menuVC") as? menuVC {
            newViewController.modalPresentationStyle = .overCurrentContext
            present(newViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func SecureCode(_ sender: UITextField) {
        if let code = sender.text,
              let codeInt = Int(code),
           secretCode == codeInt {
            tap()
        } else {
            errorLbl.isHidden = false
              }
        
 }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = "Enter the code from your email \(secretCode)"
        hideKeyboardWhenTappedAround()
        
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
