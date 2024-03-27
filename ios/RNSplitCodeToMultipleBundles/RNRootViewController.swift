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
    // Create a VC with RCTRootView from bundle url
    static func createRootVC(type: PackageType) -> RNRootViewController? {
        guard let jsbundleUrl = type.packageUrl else { return nil }
        let mockData:NSDictionary = ["nickName": "Hut's Dev",
                                     "deviceSN": "SDDNSHFKDK002",
                                     "type": type.rawValue,
                                     "UserId": "Hut"]

        let rootView = RCTRootView(
              bundleURL: jsbundleUrl,
              moduleName: type.info.moduelName,
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil)
        let vc = RNRootViewController()
        vc.title = type.info.title
        vc.view = rootView
        return vc
    }

    // Create a VC with RCTRootView from a bridge
    static func createRootVC(bridge: RCTBridge, type: PackageType) -> RNRootViewController? {
        guard let jsbundleUrl = type.packageUrl else { return nil }
        
        let mockData:NSDictionary = ["nickName": "Hut's Dev",
                                     "deviceSN": "SDDNSHFKDK002",
                                     "type": type.rawValue,
                                     "UserId": "Hut"]
        let rootView = RCTRootView(bridge: bridge,
                                   moduleName: type.info.moduelName,
                                   initialProperties: mockData as [NSObject : AnyObject])
        let vc = RNRootViewController()
        vc.title = type.info.title
        vc.view = rootView
        return vc
    }
}
