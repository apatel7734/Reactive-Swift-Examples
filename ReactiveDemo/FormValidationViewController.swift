//
//  FormValidationViewController.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 1/17/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FormValidationViewController: UIViewController {
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var formValidationObservable: Observable<Bool>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combineLatestFormValidationObservables()
        formValidationObservable.subscribe(submitButton.rx_enabled)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    func combineLatestFormValidationObservables(){
        formValidationObservable = Observable<Bool>.combineLatest(fullName.rx_text, email.rx_text, phoneNumber.rx_text) { (fullNameText, emailText, phoneNumberText) -> Bool in
                return self.isEmailValid(emailText) && self.isPhoneNumberValid(phoneNumberText) && self.isFullNameValid(fullNameText)
            }
        
        formValidationObservable.subscribeNext { (isValid: Bool) -> Void in
            print("subscribeNext : \(isValid)")
        }
        //more observables here.....
    }
    
    
    func isEmailValid(email: String) -> Bool{
        return email.characters.count > 5 ? true: false
    }
    
    func isPhoneNumberValid(phoneNumber:String) -> Bool{
        return phoneNumber.characters.count == 10 ? true : false
    }
    
    func isFullNameValid(fullName: String) -> Bool{
        return fullName.characters.count > 2 ? true : false
    }
}
