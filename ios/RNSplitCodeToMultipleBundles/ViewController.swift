//
//  ViewController.swift
//  RNSplitCodeToMultipleBundles
//
//  Created by hut on 2024/3/27.
//

import UIKit

class ViewController: UIViewController {

    var bridge: RCTBridge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a observers listen to the bridge action
        self.addObservers()
    }
    
    func addObservers() {
        // when the bundle finished load, will post this notification of RCTJavaScriptDidLoad
        NotificationCenter.default.addObserver(self, selector: #selector(javaScriptDidLoad(noti:)), name: .RCTJavaScriptDidLoad, object: nil)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let pkgType = PackageType(rawValue: sender.tag) ?? .network
        switch pkgType {
        case .common:
            guard let sourceUrl = pkgType.packageUrl else {
                print("Can't find common bundle for name: \(pkgType.info.packageName).jsbundle")
                return
            }
            self.bridge = RCTBridge(delegate: self, bundleURL: sourceUrl, moduleProvider: nil)
        case .business, .business2:
            guard let brg = self.bridge else {
                print("Must load command bundle first!!")
                return
            }
            guard let sourceUrl = pkgType.packageUrl else {
                print("Can't find common bundle for name: \(pkgType.info.packageName).jsbundle")
                return
            }
            loadScript(jsBundleLocation: sourceUrl)
            guard let brg = self.bridge,
                  let rnVC = RNRootViewController.createRootVC(bridge: brg, type: pkgType) else { return }
            self.navigationController?.pushViewController(rnVC, animated: true)
        case .main, .network:
            guard let rnVC = RNRootViewController.createRootVC(type: pkgType) else { return }
            self.navigationController?.pushViewController(rnVC, animated: true)
        }
    }
    
    @objc
    func javaScriptDidLoad(noti: Notification) {
        if let bdg = noti.object as? RCTBridge {
            print("javaScriptDidLoad with bundle URL: \(String(describing: bdg.bundleURL))")
        }
    }
    
    func loadScript(jsBundleLocation: URL) {
        if let jsData = try? Data.init(contentsOf: jsBundleLocation, options: .mappedIfSafe) {
            self.bridge?.batched().executeApplicationScript(jsData, url: jsBundleLocation, async: true)
        }
    }
}



extension ViewController: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        if let sourceUrl = PackageType.common.packageUrl {
            return sourceUrl
        } else {
            return nil
        }
    }
}

extension Notification.Name {
    static let RNBridgeChangeBundle = Notification.Name("RNBridgeChangeBunle")
}

