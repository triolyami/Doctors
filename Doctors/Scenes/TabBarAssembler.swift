//
//  TabBarAssembler.swift
//  Doctors
//
//  Created by Sergey on 19.06.2022.
//

import UIKit

enum TabBarAssembler {
    private enum Constants {
        static let homeViewControllerTabBarItemName = "Home"
        static let appointmentViewControllerTabBarItemName = "Appointment"
        static let defaultTag = 1
    }
    
    static func build() -> UITabBarController {
        let homeViewController = HomeAssembler.build()
        let appointmentViewController = AppointmentsAssembler.buildWithnavigationController()
        
        let tabbar = UITabBarController()
        tabbar.tabBar.backgroundColor = .clear
        tabbar.setViewControllers([homeViewController, appointmentViewController], animated: true)
        
        homeViewController.tabBarItem = UITabBarItem(title: Constants.homeViewControllerTabBarItemName, image: UIImage(named: Constants.homeViewControllerTabBarItemName), tag: Constants.defaultTag)
        appointmentViewController.tabBarItem = UITabBarItem(title: Constants.appointmentViewControllerTabBarItemName, image: UIImage(named: Constants.appointmentViewControllerTabBarItemName), tag: Constants.defaultTag)
        
        tabbar.tabBar.tintColor = AppColors.mainBlue.value
        tabbar.tabBar.unselectedItemTintColor = .black
        return tabbar
    }
}
