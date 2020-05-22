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
	@IBOutlet weak var buttonChair_1: UIButton! { didSet { if let image = viewModel?.desk.chairs[0].image { buttonChair_1.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_2: UIButton! { didSet { if let image = viewModel?.desk.chairs[1].image { buttonChair_2.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_3: UIButton! { didSet { if let image = viewModel?.desk.chairs[2].image { buttonChair_3.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_4: UIButton! { didSet { if let image = viewModel?.desk.chairs[3].image { buttonChair_4.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_5: UIButton! { didSet { if let image = viewModel?.desk.chairs[4].image { buttonChair_5.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_6: UIButton! { didSet { if let image = viewModel?.desk.chairs[5].image { buttonChair_6.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_7: UIButton! { didSet { if let image = viewModel?.desk.chairs[6].image { buttonChair_7.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_8: UIButton! { didSet { if let image = viewModel?.desk.chairs[7].image { buttonChair_8.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_9: UIButton! { didSet { if let image = viewModel?.desk.chairs[8].image { buttonChair_9.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_10: UIButton! { didSet { if let image = viewModel?.desk.chairs[9].image { buttonChair_10.setImage(image, for: .normal) } } }
	
	// MARK: - Properties
	
	var viewModel: DeskViewModel?
	
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
		
		if let name = viewModel?.user.name {
			labelSelect.text = "Hey " + name + " select your seat!"
		}
	}
	
	// MARK: - Actions
	
	@IBAction func actionButtonChair_1(_ sender: UIButton) {
		self.setChair(sender, 0)
	}
	@IBAction func actionButtonChair_2(_ sender: UIButton) {
		self.setChair(sender, 1)
	}
	@IBAction func actionButtonChair_3(_ sender: UIButton) {
		self.setChair(sender, 2)
	}
	@IBAction func actionButtonChair_4(_ sender: UIButton) {
		self.setChair(sender, 3)
	}
	@IBAction func actionButtonChair_5(_ sender: UIButton) {
		self.setChair(sender, 4)
	}
	@IBAction func actionButtonChair_6(_ sender: UIButton) {
		self.setChair(sender, 5)
	}
	@IBAction func actionButtonChair_7(_ sender: UIButton) {
		self.setChair(sender, 6)
	}
	@IBAction func actionButtonChair_8(_ sender: UIButton) {
		self.setChair(sender, 7)
	}
	@IBAction func actionButtonChair_9(_ sender: UIButton) {
		self.setChair(sender, 8)
	}
	@IBAction func actionButtonChair_10(_ sender: UIButton) {
		self.setChair(sender, 9)
	}
	
	func setChair(_ button: UIButton, _ index: Int) {
		if let chair = viewModel?.setChair(index) {
			button.setImage(chair.image, for: .normal)
		} else {
			print("error on setting the seat")
		}
	}
	
}
