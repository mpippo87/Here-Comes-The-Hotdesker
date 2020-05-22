//
//  HTTPMethod.swift
//  QRd
//
//  Created by Filippo Minelle on 29/02/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import Foundation

/// HTTP methods
enum HTTPMethod: String {
	/// GET [Read]:
	/// APIs are used to retrieve resource representation/information only.
	case GET
	/// POST [Create]:
	/// APIs are used to create new subordinate resources.
	case POST
	/// PUT [Update/Replace]:
	/// APIs are used primarily to update existing resource.
	case PUT
	/// DELETE [Delete]:
	/// APIs are used to delete resources.
	case DELETE
	/// PATCH [Partial Update/Modify]:
	/// requests are to make partial update on a resource.
	case PATCH
}
