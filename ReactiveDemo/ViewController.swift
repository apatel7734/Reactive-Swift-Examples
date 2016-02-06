//
//  ViewController.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 1/17/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //step 1. need observable.
        let userObservable = FakeApi.getUserObservable()
        userObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (user: User) -> Void in
                
                print("onNext : \(user.userId)")
                
                }, onError: { (errorType: ErrorType) -> Void in
                    
                    print("onError: \(errorType)")
                    
                }, onCompleted: { () -> Void in
                    
                    print("onCompleted()")
                    
                }) { () -> Void in
                    print("disposed()")
            }.addDisposableTo(disposeBag)
    }
}

