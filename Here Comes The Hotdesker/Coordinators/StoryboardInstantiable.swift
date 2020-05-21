//
//  StoryboardInstantiable.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 21/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiable: class {
	
	associatedtype MyType
	
	static var storyboardFileName: String { get }
	static var storyboardIdentifier: String { get }
	static func instanceFromStoryboard(_ bundle: Bundle?, userInterfaceIdiom: UIUserInterfaceIdiom) -> MyType
	
}

extension StoryboardInstantiable where Self: UIViewController {
	
	public static var storyboardFileName: String {
		if let storyboard = storyboardIdentifier.components(separatedBy: "ViewController").first {
			return storyboard
		}
		
		return ""
	}
	
	public static var storyboardIdentifier: String {
		return NSStringFromClass(Self.self).components(separatedBy: ".").last!
	}
	
	public static func instanceFromStoryboard(_ bundle: Bundle? = nil, userInterfaceIdiom: UIUserInterfaceIdiom = .phone) -> Self {
		let storyboard = UIStoryboard(name: storyboardFileName, bundle: bundle)
		return storyboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) as! Self
	}
	
}
