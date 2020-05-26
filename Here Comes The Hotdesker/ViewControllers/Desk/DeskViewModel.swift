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
	var desk: Desk
	/// Current user
	var user: User
	var indexChair: Int?
	
	// MARK: - Init
	
	init(user: User, desk: Desk = Desk_10()) {
		self.user = user
		self.desk = desk
	}
	
	// MARK: - Public Methods
	
	func setChair(_ index: Int) -> [Seat] {
		if (desk.seats[index].state != .busy) {
			
			var client: ClientProtocolable
			#if DEBUG
			client = ClientMock()
			#else
			client = Client()
			#endif
			
			client.postSetChair(indexChair: index, user: user) { (result) in
				switch result {
				case .success(_):
					if let currentIndex = self.indexChair {
						self.desk.seats[currentIndex].setFree()
					}
					self.desk.seats[index].setBusy(self.user)
					self.indexChair = index
					
				case . error(let error):
					print(error)
					break
				}
			}
			
		} else if (index == indexChair) {
			indexChair = nil
			desk.seats[index].setFree()
			
			// TODO: Call to set free the seat
		}
		
		return desk.seats
	}
	
}
