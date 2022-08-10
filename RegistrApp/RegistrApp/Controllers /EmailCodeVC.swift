//
//  EmailCodeVC.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 8.08.22.
//

import UIKit

class EmailCodeVC: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    let secretCode = Int.random(in: 100000...999999)
    
    
    
    
    @IBAction func SecureCode(_ sender: UITextField) {
        if let code = sender.text,
              let codeInt = Int(code),
           secretCode == codeInt {
            // go to next screen
        } else {
                  // error lbl
              }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = "Enter the code from your email \(secretCode)"
        
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
