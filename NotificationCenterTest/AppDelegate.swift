//
//  AppDelegate.swift
//  NotificationCenterTest
//
//  Created by 김민영 on 2020/06/25.
//  Copyright © 2020 KIMMINYOUNG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: nil, using: <#T##(Notification) -> Void#> )
//        
//        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: nil,  using:applicationUserDidTakeScreenshot)
        
//        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: nil) { (nft) in
//            print("==> \(UIApplication.userDidTakeScreenshotNotification)")
//        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationUserDidTakeScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        
        
        return true
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate{
    
    @objc
    func applicationUserDidTakeScreenshot(){
        guard let keyWindow = UIApplication.shared.windows.first(where: {$0.isKeyWindow}),
            let rootVC = keyWindow.rootViewController else{
                return
        }
        
        let alert = UIAlertController(title: "스크린샷 감지", message: "스크린샷이 감지되었습니다.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print("감지되었다.")
        }))
        
        rootVC.present(alert,animated: false, completion: nil)
        
    }
    
}
