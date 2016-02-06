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
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combineLatestFormValidationObservables()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func combineLatestFormValidationObservables(){
        formValidationObservable = Observable<Bool>.combineLatest(fullName.rx_text, email.rx_text, phoneNumber.rx_text) { (fullNameText, emailText, phoneNumberText) -> Bool in
            return self.isEmailValid(emailText) && self.isPhoneNumberValid(phoneNumberText) && self.isFullNameValid(fullNameText)
        }
        
        formValidationObservable.subscribe(submitButton.rx_enabled)
        
        formValidationObservable.subscribeNext { (isValid: Bool) -> Void in
            if isValid {
                self.submitButton.backgroundColor = UIColor.blueColor()
            }else{
                self.submitButton.backgroundColor = UIColor.grayColor()
            }
        }
    }
    
    
    @IBAction func onClickSubmit(sender: AnyObject) {
        let alertController = UIAlertController(title: "Enabled", message: "Enabled", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(action)
        presentViewController(alertController
            , animated: true, completion: nil)
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
