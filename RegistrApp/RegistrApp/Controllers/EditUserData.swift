//
//  EditUserData.swift
//  RegistrApp
//
//  Created by Артем Пашевич on 10.08.22.
//

import UIKit
import Firebase


class EditUserData: UIViewController {

    
    @IBOutlet weak var errorRepeatPass: UILabel!
    @IBOutlet weak var repeatPassLbl: UILabel!
    @IBOutlet weak var newPassLbl: UILabel!
    @IBOutlet weak var repeatPass: UITextField!
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var swithEdit: UISwitch! 
    @IBOutlet weak var changeUserName: UITextField!
    @IBOutlet weak var changeUserEmail: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    func userEmailOrNameEdit() {
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        let userEmail = Auth.auth().currentUser?.email
        let currentUser = Auth.auth().currentUser
        
        if changeUserEmail.text != nil {
            db.collection("Users").document("\(String(describing: userID))").updateData(["Email": changeUserEmail.text!])
            if changeUserEmail.text != userEmail {
                currentUser?.updateEmail(to: changeUserEmail.text!) { error in
                    if error != nil {
                        self.showAlertError()
                    } else {
                        self.showAlertGood()
                    }
                }
            }
        }
    }
    
    func getUserName() {
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("Users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
           
          if let dictionary = snapshot.value as? [String: AnyObject] {
              self.changeUserName.text = dictionary["Name"] as? String
             
          }
           
        })
    }
    
    func userNameEdit () {
        if changeUserName.text != nil {
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        if changeUserName.text != nil {
            db.collection("Users").document("\(String(describing: userID))").updateData(["Name": changeUserName.text!])
        }
      }
    }
    
    func userPassEdit() {
        let currentUser = Auth.auth().currentUser
        
        if !newPass.text!.isEmpty && newPass.text == repeatPass.text {
            currentUser?.updatePassword(to: newPass.text!)
        } else {
            errorRepeatPass.isHidden = false
        }
    }
    
    func showAlertGood() {
        let alertVC = UIAlertController(title: "Good",
                                       message: "Profile editing was successful!",
                                       preferredStyle: .alert)
                                   let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                                   alertVC.addAction(action)
                                   self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertError() {
        let alertVC = UIAlertController(title: "Error",
                                       message: "Editing the profile caused an error",
                                       preferredStyle: .alert)
                                   let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                                   alertVC.addAction(action)
                                   self.present(alertVC, animated: true, completion: nil)
    }
    
    func fillingInText () {
        let user = Auth.auth().currentUser
        changeUserEmail.text = user?.email
        print("\(String(describing: changeUserEmail.text))")
        changeUserName.text = user?.displayName
        print("\(String(describing: user?.displayName))")
    }
    
    @IBAction func saveData() {
        userEmailOrNameEdit()
        userPassEdit()
        userNameEdit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swithEnable(swithEdit!)
       fillingInText()
        getUserName()
    }
    
    @IBAction func swithEnable(_ sender: Any) {
        if swithEdit.isOn {
            newPass.isEnabled = true
            repeatPass.isEnabled = true
            changeUserEmail.isEnabled = true
            changeUserName.isEnabled = true
            newPassLbl.isHidden = false
            newPass.isHidden = false
            repeatPass.isHidden = false
            repeatPassLbl.isHidden = false
            saveBtn.isEnabled = true
        } else {
            newPass.isEnabled = false
            repeatPass.isEnabled = false
            changeUserEmail.isEnabled = false
            changeUserName.isEnabled = false
            newPassLbl.isHidden = true
            newPass.isHidden = true
            repeatPass.isHidden = true
            repeatPassLbl.isHidden = true
            saveBtn.isEnabled = false
        }
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
