//
//  DeskViewController.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 21/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import UIKit

class DeskViewController: UIViewController, StoryboardInstantiable {
	
	// MARK: - Views
	
	@IBOutlet weak var labelSelect: UILabel!
	@IBOutlet weak var buttonChair_1: UIButton!
	@IBOutlet weak var buttonChair_2: UIButton!
	@IBOutlet weak var buttonChair_3: UIButton!
	@IBOutlet weak var buttonChair_4: UIButton!
	@IBOutlet weak var buttonChair_5: UIButton!
	@IBOutlet weak var buttonChair_6: UIButton!
	@IBOutlet weak var buttonChair_7: UIButton!
	@IBOutlet weak var buttonChair_8: UIButton!
	@IBOutlet weak var buttonChair_9: UIButton!
	@IBOutlet weak var buttonChair_10: UIButton!
	
	// MARK: - Properties
	
	let viewModel: DeskViewModel = DeskViewModel()
	
	var chair_1: String?
	var chair_2: String?
	var chair_3: String?
	var chair_4: String?
	var chair_5: String?
	var chair_6: String?
	var chair_7: String?
	var chair_8: String?
	var chair_9: String?
	var chair_10: String?
	 
	var name: String = "Name"
	
	// Actions
	var dismiss: (() -> Void)?
	
	// MARK: - StoryboardInstantiable
	
	public class func istantiate() -> DeskViewController {
		let viewController = instanceFromStoryboard()
		return viewController
	}
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		labelSelect.text = "Hey " + name + " select your seat!"
	}
	
	// MARK: - Actions
	
	@IBAction func actionButtonChair_1(_ sender: UIButton) {
		self.setChair(sender, chair: chair_1)
	}
	@IBAction func actionButtonChair_2(_ sender: UIButton) {
		self.setChair(sender, chair: chair_2)
	}
	@IBAction func actionButtonChair_3(_ sender: UIButton) {
		self.setChair(sender, chair: chair_3)
	}
	@IBAction func actionButtonChair_4(_ sender: UIButton) {
		self.setChair(sender, chair: chair_4)
	}
	@IBAction func actionButtonChair_5(_ sender: UIButton) {
		self.setChair(sender, chair: chair_5)
	}
	@IBAction func actionButtonChair_6(_ sender: UIButton) {
		self.setChair(sender, chair: chair_6)
	}
	@IBAction func actionButtonChair_7(_ sender: UIButton) {
		self.setChair(sender, chair: chair_7)
	}
	@IBAction func actionButtonChair_8(_ sender: UIButton) {
		self.setChair(sender, chair: chair_8)
	}
	@IBAction func actionButtonChair_9(_ sender: UIButton) {
		self.setChair(sender, chair: chair_9)
	}
	@IBAction func actionButtonChair_10(_ sender: UIButton) {
		self.setChair(sender, chair: chair_10)
	}
	
	func setChair(_ button: UIButton, chair: String?) {
//		if (chair != nil) {
//
//		} else {
			button.setImage(UIImage(named: "image_chair_busy_left"), for: .normal)
//		}
	}
	
}
