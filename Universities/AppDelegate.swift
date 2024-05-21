//
//  AppDelegate.swift
//  Universities
//
//  Created by Khaled Kamal on 20/05/2024.
//

import UIKit
import UniversitiesList

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupWindow()
        if let view = UniversitiesListWireFrame.createModule() as? UIViewController {
            window?.rootViewController = view
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}

private extension AppDelegate {
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

    }
    
}
