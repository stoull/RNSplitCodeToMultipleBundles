//
//  RNBridge.swift
//  RNSplitCodeToMultipleBundles
//
//  Created by hut on 2024/3/27.
//

import Foundation

@objc(RNModuleManager)
class RNBridge: NSObject {
    static let shared = RNBridge()
    
    var bridge: RCTBridge?
    
    convenience init(type: PackageType) {
        self.init()
        self.setupBridge(type: type)
    }
    
    override init() {
        super.init()
        self.addObservers()
    }
    
    func setupBridge(type: PackageType) {
        if let sourceUrl = PackageType.common.packageUrl {
//            self.bridge = RCTBridge(delegate: self, bundleURL: sourceUrl, moduleProvider: nil)
        }
    }
    

    func addObservers() {
        // RCTJavaScriptDidLoadNotification
//        NotificationCenter.default.addObserver(self, selector: #selector(changeView(noti:)), name: .RCTJavaScriptDidLoad, object: nil)
    }
    
//    @objc func changeView(noti: Notification) {
//        if let bdg = noti.object as? RCTBridge {
////            print("RCTJavaScriptDidLoad: \(bdg.description)")
//            print("RCTJavaScriptDidLoad bundleURl: \(bdg.bundleURL)")
//        }
//        
//        if let userInfo = noti.userInfo as? [String: Any] {
//            if let xxbdg = userInfo["bridge"] as? RCTCxxBridge {
////                print("RCTJavaScriptDidLoad2: \(xxbdg.description)")
//            }
//        }
//        
//        let iosModule = PackageType.inverterkit
//        if let iosURL = iosModule.packageUrl {
//            self.loadScript(jsBundleLocation: iosURL, bundleName: iosModule.info.moduelName)
//        }
//    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        removeObservers()
    }
    
//    func loadScript(jsBundleLocation: URL, bundleName: String) {
//        if let jsData = try? Data.init(contentsOf: jsBundleLocation, options: .mappedIfSafe) {
//            print("loadScript ApplicationScript bundleURl: \(jsBundleLocation)")
//            self.bridge?.batched().executeApplicationScript(jsData, url: jsBundleLocation, async: true)
//            
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4.0) {
//                if let rBr = self.bridge,
//                   let mainTestVC = RNRootVC.createRootVC(bridge: rBr, type: .inverterkit, nickName: "TestMain", deviceSN: "0XSSXXDDD") {
//                    if let nvc = UIApplication.topNavigationController() {
//                        nvc.pushViewController(mainTestVC, animated: true)
//                    }
//                }
//            }
//        } else {
//            print("jsData 转有问题")
//        }
//    }
    
//    / 下面是一个通用的方法 我把 loadScript 抽成一个自己的方法了 参数需要两个bundle path & name
//    -(**void**) loadScript:(NSString *)bundlePath bunldeName: (NSString *)bunldeName {
//
//        NSURL  *jsCodeLocation = [[NSBundle mainBundle] URLForResource:bundlePath withExtension:@"bundle"];
//
//    // 这里就是 如果 bridge 已经完成初始化 就能去载入 biz bundle 使用的到的就是 executeSourceCode 方法
//        **if**(**self**.bridge) {
//            NSError *error = **nil**;
//            NSData *sourceBuz = [NSData dataWithContentsOfFile:jsCodeLocation.path
//                                                    options:NSDataReadingMappedIfSafe
//                                                      error:&error];
//
//            [**self**.bridge.batchedBridge executeSourceCode:sourceBuz sync:**NO**];
//            RCTRootView *rootView =
//              [[RCTRootView alloc] initWithBridge:**self**.bridge moduleName:bunldeName initialProperties:**nil**];
//            UIViewController *vc = [[UIViewController alloc] init];
//            [self setView: rootView];
//
//        };
//
//    }
}

extension RNBridge: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        if let sourceUrl = PackageType.common.packageUrl {
            return sourceUrl
        } else {
            return nil
        }
    }
}

extension Notification.Name {
    static let RNBridgeChangeBunle = Notification.Name("RNBridgeChangeBunle")
}
