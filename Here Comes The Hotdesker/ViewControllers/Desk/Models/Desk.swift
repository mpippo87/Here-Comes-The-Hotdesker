//
//  Table.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

class Desk {
	
	// MARK: - Properties
	
	var chairs: [Chair] = [Chair]()
	
}

final class Desk_10: Desk {
	
	override init() {
		super.init()
		chairs = [Chair](repeating: Chair(kind: Chair.Kind.top, state: Chair.State.free, user: nil), count: 10)
		
		chairs[1].kind = .top
		
		chairs[1].kind = .right
		chairs[2].kind = .right
		chairs[3].kind = .right
		chairs[4].kind = .right
		
		chairs[5].kind = .bottom
		
		chairs[6].kind = .left
		chairs[7].kind = .left
		chairs[8].kind = .left
		chairs[9].kind = .left
	}
	
}
