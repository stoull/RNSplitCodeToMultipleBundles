//
//  RCTBridge+PackageBundle.h
//  SeparateRNPackage
//
//  Created by hut on 2024/3/18.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>

#ifndef RCTBridge_PackageBundle_h
#define RCTBridge_PackageBundle_h



@interface RCTBridge (PackageBundle)

// exports the private method from RCTBridge
- (RCTBridge *)batchedBridge;
// exports the private method
- (void)executeApplicationScript:(NSData *)script url:(NSURL *)url async:(BOOL)async;
@end

#endif /* RCTBridge_PackageBundle_h */
