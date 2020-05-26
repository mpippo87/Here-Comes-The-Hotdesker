//
//  Seat.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 22/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import UIKit

struct Seat {
	
	// MARK: - Types
	
	enum Kind {
		case top
		case right
		case left
		case bottom
		
		var imageFree: UIImage {
			switch self {
			case .top:
				return UIImage.chairFree_top
			case .right:
				return UIImage.chairFree_right
			case .left:
				return UIImage.chairFree_left
			case .bottom:
				return UIImage.chairFree_bottom
			}
		}
		var imageBusy: UIImage {
			switch self {
			case .top:
				return UIImage.chairBusy_top
			case .right:
				return UIImage.chairBusy_right
			case .left:
				return UIImage.chairBusy_left
			case .bottom:
				return UIImage.chairBusy_bottom
			}
		}
		
		func image(state: State) -> UIImage {
			switch self {
			case .top:
				return (state == .free) ? UIImage.chairFree_top : UIImage.chairBusy_top
			case .right:
				return (state == .free) ? UIImage.chairFree_right : UIImage.chairBusy_right
			case .left:
				return (state == .free) ? UIImage.chairFree_left : UIImage.chairBusy_left
			case .bottom:
				return (state == .free) ? UIImage.chairFree_bottom : UIImage.chairBusy_bottom
			}
		}
		
	}
	
	enum State {
		case free
		case busy
	}
	
	// MARK: - Properties
	
	var kind: Kind = .top
	var state: State = .free
	var image: UIImage {
		switch kind {
		case .top:
			return (state == .free) ? UIImage.chairFree_top : UIImage.chairBusy_top
		case .right:
			return (state == .free) ? UIImage.chairFree_right : UIImage.chairBusy_right
		case .left:
			return (state == .free) ? UIImage.chairFree_left : UIImage.chairBusy_left
		case .bottom:
			return (state == .free) ? UIImage.chairFree_bottom : UIImage.chairBusy_bottom
		}
	}
	var user: User?
	
	// MARK: - Public Methods
	
	mutating func setFree() {
		self.state = .free
		self.user = nil
	}
	
	mutating func setBusy(_ user: User) {
		self.state = .busy
		self.user = user
	}
	
}
