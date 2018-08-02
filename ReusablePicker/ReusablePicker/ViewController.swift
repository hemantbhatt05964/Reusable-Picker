//
//  ViewController.swift
//  ReusablePicker
//
//  Created by Chetu on 7/6/18.
//  Copyright © 2018 LocatorTechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reusableView: PatrollingStaffTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reusableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: PatrollingTableViewDelegate {
    func onItemClick(dateString:Date, textField: UITextField) {
        textField.text = "date"
        debugPrint(dateString)
    }
}
