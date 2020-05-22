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
	
	// MARK: - Init
	
	init(user: User) {
		self.user = user
	}
	
	// MARK: - Public Methods
	
	func setChair(_ index: Int) -> Chair {
		desk.chairs[index].state = (desk.chairs[index].state == .free) ? .busy : .free
		print("set chair[\(index)]: \(desk.chairs[index])")
		return desk.chairs[index]
	}
	
}
