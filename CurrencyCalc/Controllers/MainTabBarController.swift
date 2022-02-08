//
//  MainTabBarController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 08.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let converterVC = ConverterViewController()
        let coursesVC = CoursesTableViewController()
        
        viewControllers = [
            setUpNavigationController(title: "Конвертер",
                                      image: UIImage(systemName: "dollarsign.circle.fill"),
                                      rootViewController: converterVC),
            setUpNavigationController(title: "Курсы валют",
                                      image: UIImage(systemName: "list.bullet"),
                                      rootViewController: coursesVC)
        ]
        
        
    }
    
    private func setUpNavigationController(title: String, image: UIImage?, rootViewController: UIViewController) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.image = image
        navigationViewController.tabBarItem.title = title
        return navigationViewController
    }
}
