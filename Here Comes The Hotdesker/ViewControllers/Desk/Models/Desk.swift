//
//  Desk.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

class Desk {
	
	// MARK: - Properties
	
	var seats: [Seat] = [Seat]()
	
}

final class Desk_10: Desk {
	
	override init() {
		super.init()
		seats = [Seat](repeating: Seat(kind: Seat.Kind.top, state: Seat.State.free, user: nil), count: 10)
		
		seats[1].kind = .top
		
		seats[1].kind = .right
		seats[2].kind = .right
		seats[3].kind = .right
		seats[4].kind = .right
		
		seats[5].kind = .bottom
		
		seats[6].kind = .left
		seats[7].kind = .left
		seats[8].kind = .left
		seats[9].kind = .left
	}
	
}
