//
//  LoginViewController.swift
//  CarinaDemoApp
//
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderSwitch: UISegmentedControl!
    @IBOutlet weak var privacySwitch: UISwitch!
    @IBOutlet weak var logibBtn: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var privacyLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupHideKeyboardOnTap()
        setupLocalization()
        
        name.delegate = self
        password.delegate = self
    }
  
    func setupLocalization(){
        name.placeholder = "login.name".localized
        password.placeholder = "login.password".localized
        privacyLabel.text = "login.privacy".localized
        genderSwitch.setTitle("login.male".localized, forSegmentAt: 0)
        genderSwitch.setTitle("login.female".localized, forSegmentAt: 1)
        logibBtn.setTitle("login.signUp".localized, for: .normal)
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        name.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        checkIsNeedToEnableLoginButton()
    }
    
    @IBAction func genderSwitchStateChanged(_ sender: UISegmentedControl) {
        checkIsNeedToEnableLoginButton()
    }
    @IBAction func nameChanged(_ sender: Any) {
        checkIsNeedToEnableLoginButton()
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        checkIsNeedToEnableLoginButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name {
            password.becomeFirstResponder()
        } else if textField == password {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 200, width:self.view.frame.size.width, height:self.view.frame.size.height)
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 200, width:self.view.frame.size.width, height:self.view.frame.size.height)
        })
    }
    
    func checkIsNeedToEnableLoginButton() {
        var isNeedToEnableButton = false
        
        isNeedToEnableButton = privacySwitch.isOn
        isNeedToEnableButton = isNeedToEnableButton && !name.text!.isEmpty
        isNeedToEnableButton = isNeedToEnableButton && !password.text!.isEmpty
        
        if (isNeedToEnableButton) {
            logibBtn.isEnabled = true
        } else {
            logibBtn.isEnabled = false
        }
    }
}

extension UIViewController {
    
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
