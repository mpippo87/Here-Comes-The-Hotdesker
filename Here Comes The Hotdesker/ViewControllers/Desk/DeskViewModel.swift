//
//  DeskViewModel.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 21/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

final class DeskViewModel {
	
	// MARK: - Properties
	
	/// Desk
	var desk: Desk = Desk_10()
	
	/// Current user
	var user: User
	var indexChair: Int?
	
	// MARK: - Init
	
	init(user: User) {
		self.user = user
	}
	
	// MARK: - Public Methods
	
	func setChair(_ index: Int) -> [Chair] {
		if (desk.chairs[index].state != .busy) {
			
			// TODO: Call Server
			
			if let currentIndex = indexChair {
				desk.chairs[currentIndex].setFree()
			}
			desk.chairs[index].setBusy(user)
			indexChair = index
			
		} else if (index == indexChair) {
			desk.chairs[index].setFree()
		}
		
		return desk.chairs
	}
	
}
