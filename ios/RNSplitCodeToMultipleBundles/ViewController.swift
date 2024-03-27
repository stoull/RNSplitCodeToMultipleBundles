//
//  ViewController.swift
//  RNSplitCodeToMultipleBundles
//
//  Created by hut on 2024/3/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            if let rnVC = RNRootViewController.createRootVC(type: .common) {
                rnVC.title = "Whole Package"
                self.navigationController?.pushViewController(rnVC, animated: true)
            }
        }
    }
    
}

