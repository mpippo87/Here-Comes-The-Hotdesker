//
//  Client.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

class Client {
	
	// MARK: - Properties
	
	private let network = Network()
	
	// MARK: - Requests
	
	func getAllChairsStatuses(completion: @escaping (Result<Data, Error>) -> ()) {
		guard let url = Target.allChairsStatuses.baseURL?.appendingPathComponent(Target.allChairsStatuses.path) else {
			completion(.error(NSError()))
			return
		}
		
		network.get(url: url, completion: completion)
	}
	
	func postSetChair(indexChair: Int, user: User, completion: @escaping (Result<Data, Error>) -> ()) {
		guard let url = Target.setChair.baseURL?.appendingPathComponent(Target.setChair.path).appendingPathComponent(String(indexChair)).appendingPathComponent(String(user.name)) else {
			completion(.error(NSError()))
			return
		}
		
		network.post(url: url, body: [:], completion: completion)
	}
	
	func getAllGroups(completion: @escaping (Result<Data, Error>) -> ()) {
		guard let url = Target.allGroups.baseURL?.appendingPathComponent(Target.allGroups.path) else {
			completion(.error(NSError()))
			return
		}
		
		network.get(url: url, completion: completion)
	}
	
}
