//
//  PackageType.swift
//  RNSplitCodeToMultipleBundles
//
//  Created by hut on 2024/3/27.
//

import Foundation
enum PackageType: Int {
    case common = 0
    case business
    case business2
    case main
    case network
    
    var info: (moduelName: String, packageName: String, title: String) {
        var title: String = ""
        var module: String = ""
        var pkg: String = ""
        switch self {
        case .common:
            title = "common bundle"
            module = "common"
            pkg = "common.ios"
        case .business:
            title = "business bundle"
            module = "RNSplitCodeToMultipleBundles"
            pkg = "business.ios"
        case .main:
            title = "main bundle"
            module = "RNSplitCodeToMultipleBundles"
            pkg = "main.ios"
        case .business2:
            title = "business2 bundle"
            module = "business2"
            pkg = "business2.ios"
        case .network:
            title = "network bundle"
            module = "RNSplitCodeToMultipleBundles"
            pkg = "RNSplitCodeToMultipleBundles"
        }
        return (module, pkg, title)
    }
    
    var packageUrl: URL? {
        if self == .network {
            guard let jsBundleLocation = URL(string: "http://20.4.2.128:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
            return jsBundleLocation
        } else {
            guard let jsBundleLocation = Bundle.main.url(forResource: self.info.packageName, withExtension: "jsbundle") else { return nil }
            return jsBundleLocation
        }
    }
}
