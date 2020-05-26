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
	
	// StackViews
	@IBOutlet weak var stackViewButtonLeft: UIStackView!
	@IBOutlet weak var stackViewLabelRight: UIStackView!
	
	// Buttons
	@IBOutlet weak var buttonChair_1: UIButton! { didSet { if let image = viewModel?.desk.seats[0].image { buttonChair_1.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_2: UIButton! { didSet { if let image = viewModel?.desk.seats[1].image { buttonChair_2.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_3: UIButton! { didSet { if let image = viewModel?.desk.seats[2].image { buttonChair_3.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_4: UIButton! { didSet { if let image = viewModel?.desk.seats[3].image { buttonChair_4.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_5: UIButton! { didSet { if let image = viewModel?.desk.seats[4].image { buttonChair_5.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_6: UIButton! { didSet { if let image = viewModel?.desk.seats[5].image { buttonChair_6.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_7: UIButton! { didSet { if let image = viewModel?.desk.seats[6].image { buttonChair_7.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_8: UIButton! { didSet { if let image = viewModel?.desk.seats[7].image { buttonChair_8.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_9: UIButton! { didSet { if let image = viewModel?.desk.seats[8].image { buttonChair_9.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonChair_10: UIButton! { didSet { if let image = viewModel?.desk.seats[9].image { buttonChair_10.setImage(image, for: .normal) } } }
	@IBOutlet weak var buttonSlack: UIButton!
	
	// Labels
	@IBOutlet weak var labelChair_1: UILabel!
	@IBOutlet weak var labelChair_2: UILabel!
	@IBOutlet weak var labelChair_3: UILabel!
	@IBOutlet weak var labelChair_4: UILabel!
	@IBOutlet weak var labelChair_5: UILabel!
	@IBOutlet weak var labelChair_6: UILabel!
	@IBOutlet weak var labelChair_7: UILabel!
	@IBOutlet weak var labelChair_8: UILabel!
	@IBOutlet weak var labelChair_9: UILabel!
	@IBOutlet weak var labelChair_10: UILabel!
	
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
			labelSelect.text = "Hey " + name.uppercased() + " select your seat!"
		}
		
		if let chairs = viewModel?.desk.seats {
			setChairs(seats: chairs)
		}
		
	}
	
	func setSpacing(_ stackView: UIStackView) {
		if UIDevice().userInterfaceIdiom == .phone {
			switch UIScreen.main.nativeBounds.height {
			case 1136:
				stackView.spacing = 40.0
			case 1334:
				stackView.spacing = 45.0
			case 1920, 2208:
				stackView.spacing = 65.0
			case 2436:
				stackView.spacing = 90.0
			case 2688:
				stackView.spacing = 95.0
			case 1792:
				stackView.spacing = 90.0
			default:
				break
			}
		}
	}
	
	func setChairs(seats: [Seat]) {
		for (index, seat) in seats.enumerated() {
			switch index {
			case 0:
				buttonChair_1.setImage(seat.image, for: .normal)
				labelChair_1.text = seat.user?.name ?? "-"
			case 1:
				buttonChair_2.setImage(seat.image, for: .normal)
				labelChair_2.text = seat.user?.name ?? "-"
			case 2:
				buttonChair_3.setImage(seat.image, for: .normal)
				labelChair_3.text = seat.user?.name ?? "-"
			case 3:
				buttonChair_4.setImage(seat.image, for: .normal)
				labelChair_4.text = seat.user?.name ?? "-"
			case 4:
				buttonChair_5.setImage(seat.image, for: .normal)
				labelChair_5.text = seat.user?.name ?? "-"
			case 5:
				buttonChair_6.setImage(seat.image, for: .normal)
				labelChair_6.text = seat.user?.name ?? "-"
			case 6:
				buttonChair_7.setImage(seat.image, for: .normal)
				labelChair_7.text = seat.user?.name ?? "-"
			case 7:
				buttonChair_8.setImage(seat.image, for: .normal)
				labelChair_8.text = seat.user?.name ?? "-"
			case 8:
				buttonChair_9.setImage(seat.image, for: .normal)
				labelChair_9.text = seat.user?.name ?? "-"
			case 9:
				buttonChair_10.setImage(seat.image, for: .normal)
				labelChair_10.text = seat.user?.name ?? "-"
			default:
				break
			}
		}
	
		buttonSlack.isHidden = ((viewModel?.indexChair) != nil) ? false : true
	}
	
	// MARK: - Actions
	
	@IBAction func actionButtonChair_1(_ sender: UIButton) {
		self.setChair(sender, labelChair_1 , 0)
	}
	@IBAction func actionButtonChair_2(_ sender: UIButton) {
		self.setChair(sender, labelChair_2 , 1)
	}
	@IBAction func actionButtonChair_3(_ sender: UIButton) {
		self.setChair(sender, labelChair_3 , 2)
	}
	@IBAction func actionButtonChair_4(_ sender: UIButton) {
		self.setChair(sender, labelChair_4 , 3)
	}
	@IBAction func actionButtonChair_5(_ sender: UIButton) {
		self.setChair(sender, labelChair_5 , 4)
	}
	@IBAction func actionButtonChair_6(_ sender: UIButton) {
		self.setChair(sender, labelChair_6 , 5)
	}
	@IBAction func actionButtonChair_7(_ sender: UIButton) {
		self.setChair(sender, labelChair_7 , 6)
	}
	@IBAction func actionButtonChair_8(_ sender: UIButton) {
		self.setChair(sender, labelChair_8 , 7)
	}
	@IBAction func actionButtonChair_9(_ sender: UIButton) {
		self.setChair(sender, labelChair_9 , 8)
	}
	@IBAction func actionButtonChair_10(_ sender: UIButton) {
		self.setChair(sender, labelChair_10 , 9)
	}
	
	func setChair(_ button: UIButton, _ label: UILabel, _ index: Int) {
		if let seats = viewModel?.setChair(index) {
			setChairs(seats: seats)
		}
	}
	
	@IBAction func actionButtonSlack(_ sender: UIButton) {
		if let url = URL(string: "slack://open?") {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
	
}
