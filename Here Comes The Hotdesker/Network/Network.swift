//
//  Network.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

public enum Result<Value, Error: Swift.Error> {
	
	case success(Value)
	case error(Error)
	
}

class Network {
	
	// MARK: - Singleton
	
	public static let shared = Network()
	
	// MARK: - Properties
	
	let host: String = "https://vapor-qrd.herokuapp.com"
	private let urlSession = URLSession.shared
	
	// MARK: -  Public Methods
	
	func get(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			self.taskBloc(data: data, response: response, error: error, completion: completion)
		}
		
		task.resume()
	}
	
	func post(url: URL, body: [String: Any], headerFields: [String: String]? = nil, parameterEncoding: ParameterEncoding = .JSONEncoding, completion: @escaping (Result<Data, Error>) -> ()) {
		// Request
		var request = URLRequest(url: url)
		
		// Header
		request = adaptHeader(request: request, method: .POST, headerFields: headerFields, parameterEncoding: parameterEncoding)
		
		// Body
		do {
			request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
		} catch let error {
			completion(Result.error(error))
		}
		
		// Task
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			self.taskBloc(data: data, response: response, error: error, completion: completion)
		}
		
		task.resume()
	}
	
	// MARK: -  Private Methods
	
	private func adaptHeader(request: URLRequest, method: HTTPMethod, headerFields: [String: String]? = nil, parameterEncoding: ParameterEncoding) -> URLRequest {
		var request = request
		
		// Method
		request.httpMethod = method.rawValue
		
		// Parameter Encoding
		switch parameterEncoding {
		case .JSONEncoding:
			request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
			request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
		case .URLEncoding:
			break
		}
		
		// Header Fields
		if let headerFields = headerFields {
			headerFields.forEach({ (key: String, value: String) in
				request.setValue(value, forHTTPHeaderField: key)
			})
		}
		
		return request
	}
	
	private func taskBloc(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<Data, Error>) -> ()) {
		DispatchQueue.main.async {
			if let error = error {
				completion(.error(error))
				return
			}
			
			if let httpStatus = response as? HTTPURLResponse, (httpStatus.statusCode != 200) {
				completion(.error(NSError(domain: "httpStatusCode", code: httpStatus.statusCode, userInfo: nil)))
				return
			}
			
			guard let data = data else {
				completion(.error(NSError(domain: "dataNilError", code: -100001, userInfo: nil)))
				return
			}
			
			do {
				guard (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil else {
					completion(.error(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
					return
				}
				
				completion(.success(data))
				
			} catch let jsonError {
				completion(.error(jsonError))
			}
		}
	}
	
}
