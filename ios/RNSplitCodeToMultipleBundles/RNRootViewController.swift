//
//  RNRootViewController.swift
//  RNSplitCodeToMultipleBundles
//
//  Created by hut on 2024/3/27.
//

import UIKit
import React

class RNRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}


extension RNRootViewController {
    static func createRootVC(type: PackageType) -> RNRootViewController? {
        
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else { return nil }
        
        guard let jsBundleLocation = URL(string: "http://20.4.2.128:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        
        let mockData:NSDictionary = ["nickName": "Hut's Dev",
                                     "deviceSN": "SDDNSHFKDK002",
                                     "online": 1,
                                     "UserId": "Hut"]
        
          let rootView = RCTRootView(
              bundleURL: jsBundleLocation,
              moduleName: "RNSplitCodeToMultipleBundles",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = RNRootViewController()
          vc.view = rootView
        return vc
    }

}
