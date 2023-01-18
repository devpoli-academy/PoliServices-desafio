//
//  AppDelegate.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 30/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeNavigationControllerFactory()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func homeNavigationControllerFactory() -> UINavigationController {
        
        let homeViewModel = HomeViewModel()
        
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewModel.scheduledServiceDelegate = homeViewController
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        return homeNavigationController
    }
}
