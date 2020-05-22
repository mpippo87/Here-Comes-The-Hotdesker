//
//  Target.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

enum Target {
	
	case allChairsStatuses
	case setChair
	case allGroups
	
	// MARK: - Properties
	
	var baseURL: URL? {
		return URL(string: Network().host)
	}
	
	var path: String {
		switch self {
		case .allChairsStatuses: return "/hotdesker/getAllChairsStatuses"
		case .setChair: return "/hotdesker/setChairStatus/{chairId}/{userName}"
		case .allGroups: return "/hotdesker/getAllGroups"
		}
	}
	
	var method: HTTPMethod {
		switch self {
		case .allChairsStatuses: return .GET
		case .setChair: return .POST
		case .allGroups: return .GET
		}
	}
	
	var headers: [String: String]? {
		switch self {
		case .allChairsStatuses: return nil
		case .setChair: return nil
		case .allGroups: return nil
		}
	}
	
	var parameterEncoding: ParameterEncoding {
		switch self {
		case .allChairsStatuses: return ParameterEncoding.URLEncoding
		case .setChair:  return ParameterEncoding.URLEncoding
		case .allGroups: return ParameterEncoding.URLEncoding
		}
	}
	
}
