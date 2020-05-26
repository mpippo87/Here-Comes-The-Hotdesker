//
//  Client.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

protocol ClientProtocolable {
	func getAllChairsStatuses(completion: @escaping (Result<Data, Error>) -> ())
	func postSetChair(indexChair: Int, user: User, completion: @escaping (Result<Data, Error>) -> ())
	func getAllGroups(completion: @escaping (Result<Data, Error>) -> ())
}

class Client: ClientProtocolable {
	
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

class ClientMock: ClientProtocolable {
	
	// MARK: - Properties
	
	private let network = Network()
	
	// MARK: - Requests
	
	func getAllChairsStatuses(completion: @escaping (Result<Data, Error>) -> ()) {
		let statuses = Statuses(statuses: [Status(chairId: 0, occupied: true, user: "Marzieh"),
										   Status(chairId: 1, occupied: true, user: "Kay")])
		do {
			let jsonData = try JSONEncoder().encode(statuses)
			completion(.success(jsonData))
		} catch {
			print(error)
			completion(.error(error))
		}
				
	}
	
	func postSetChair(indexChair: Int, user: User, completion: @escaping (Result<Data, Error>) -> ()) {
		completion(.success(Data()))
	}
	
	func getAllGroups(completion: @escaping (Result<Data, Error>) -> ()) {
		completion(.success(Data()))
	}
	
}
