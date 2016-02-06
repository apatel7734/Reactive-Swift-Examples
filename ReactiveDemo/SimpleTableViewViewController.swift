//
//  SimpleTableViewViewController.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 2/5/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SimpleTableViewViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    @IBOutlet weak var simpleTableView: UITableView!
    var stringItems = Variable([String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stringItems.value.append("First Item")
        stringItems.value.append("Second Item")
        stringItems.value.append("Third Item")
        
        configureTableView()
    }
    
    func configureTableView(){
        
        stringItems.asObservable()
            .bindTo(simpleTableView.rx_itemsWithCellIdentifier("simpletableviewcell", cellType: SimpleTableViewCell.self)) { (row, element, cell) in
                cell.simpleLabel.text = "\(element) @ row \(row)"
            }
            .addDisposableTo(disposeBag)
        
        simpleTableView
            .rx_modelSelected(String)
            .subscribeNext { value in
                print("Tapped `\(value)`")
            }
            .addDisposableTo(disposeBag)
        
    }
    
    @IBAction func didTapRefreshData(sender: AnyObject) {
        stringItems.value.append("Fourth Item")
        stringItems.value.append("Fifth Item")
        stringItems.value.append("Sixth Item")
    }
    
}
