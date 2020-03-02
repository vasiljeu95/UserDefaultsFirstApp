//
//  ViewController.swift
//  UserDefaultsFirstApp
//
//  Created by Stepan Vasilyeu on 3/2/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let userName = UserDefaults.standard.value(forKey: "userName") {
//            userNameLabel.text = userName as? String
//        } else {
//            userNameLabel.text = user.fullName
//        }
        
        user = StorageManager.shared.fetchUser()
        userNameLabel.text = user.fullName
    }

    @IBAction func doneButtonPressed() {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
            wrongFormatAllert(massege: "First Name")
            return
        }
        
        guard let secondName = secondNameTextField.text, !secondName.isEmpty else {
            wrongFormatAllert(massege: "Second Name")
            return
        }
        
        if let _ = Double(firstName) {
            wrongFormatAllert(massege: "First Name")
        } else if let _ = Double(secondName) {
            wrongFormatAllert(massege: "Second Name")
        } else {
            user.name = firstName
            user.surname = secondName
            userNameLabel.text = user.fullName
            
            StorageManager.shared.saveUser(user)
        }
        
        
        firstNameTextField.text = nil
        secondNameTextField.text = nil
        
    }

}

extension ViewController {
    private func wrongFormatAllert(massege: String) {
        let alert = UIAlertController(
            title: "Wrong Format!",
            message: "Please enter your \(massege)",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
