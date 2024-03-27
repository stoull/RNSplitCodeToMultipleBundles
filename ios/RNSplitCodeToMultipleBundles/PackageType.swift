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
    
    var info: (name: String, moduelName: String, packageName: String) {
        var n: String = ""
        var module: String = ""
        var pkg: String = ""
        switch self {
        case .common:
            n = "common"
            module = "common"
            pkg = "common.ios"
        case .business:
            n = "business"
            module = "business"
            pkg = "business.ios"
        }
        return (n, module, pkg)
    }
    
    var packageUrl: URL? {
        guard let jsBundleLocation = Bundle.main.url(forResource: self.info.packageName, withExtension: "jsbundle") else { return nil }
        return jsBundleLocation
    }
}
