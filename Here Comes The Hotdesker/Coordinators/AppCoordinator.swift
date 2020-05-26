//
//  AppCoordinator.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 21/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {
	
	// MARK: Properties
	
	var window: UIWindow
	var loginNavigationController: UINavigationController?
	
	// MARK: Lifecycle
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		
		// LoginViewController
		let loginViewController = LoginViewController.istantiate()
		loginViewController.findASeat = { (user) in
			self.presentTable(from: loginViewController, with: user)
		}
		
		// NavigationController
		loginNavigationController = UINavigationController(rootViewController: loginViewController)
		loginNavigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		loginNavigationController?.navigationBar.shadowImage = UIImage()
		loginNavigationController?.navigationBar.isTranslucent = true
		loginNavigationController?.view.backgroundColor = .clear
		
		// Window
		window.rootViewController = loginNavigationController
		window.makeKeyAndVisible()
	}
	
	func presentTable(from viewController: UIViewController, with user: User) {
		let deskViewController = DeskViewController.istantiate()
		
		var client: ClientProtocolable
		#if DEBUG
		client = ClientMock()
		#else
		client = Client()
		#endif
		
		client.getAllChairsStatuses { (result) in
			switch result {
			case .success(let data):
				do {
					let statuses: Statuses = try JSONDecoder().decode(Statuses.self, from: data)
					
					let desk = Desk_10()
					statuses.statuses.forEach { (status) in
						desk.seats[status.chairId].setBusy(User.init(name: status.user))
					}
					
					deskViewController.viewModel = DeskViewModel(user: user, desk: desk)
					if let navigationController = self.window.rootViewController as? UINavigationController {
						navigationController.pushViewController(deskViewController, animated: true)
					}
				} catch  {
					print("§ error: \(error)")
				}
				
			case .error(let error):
				print(error)
				break
			}
		}
		
	}
	
}
