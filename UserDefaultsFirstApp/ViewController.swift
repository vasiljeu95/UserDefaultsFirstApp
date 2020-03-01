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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.isHidden = true
        
        if let userName = UserDefaults.standard.value(forKey: "userName") {
            userNameLabel.isHidden = false
            userNameLabel.text = userName as? String
        }
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
            let fullName = "\(firstName) \(secondName)"
            userNameLabel.text = fullName
            userNameLabel.isHidden = false
            
            UserDefaults.standard.set(fullName, forKey: "userName")
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
