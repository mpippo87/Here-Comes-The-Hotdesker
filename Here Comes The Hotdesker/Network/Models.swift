//
//  Network+Models.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 26/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

struct Statuses: Codable {
		var statuses: [Status]
}

struct Status: Codable {
	var chairId: Int = 0
	var occupied: Bool = false
	var user: String = ""
}

struct Groups: Codable {
		var groups: [Group]
}

struct Group: Codable {
	var groupId: Int = 0
	var members: [String]
}
