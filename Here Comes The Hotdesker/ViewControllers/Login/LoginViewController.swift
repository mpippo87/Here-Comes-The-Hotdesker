//
//  LoginViewController.swift
//  Here Comes The Hotdesker
//
//  Created by Filippo Minelle on 21/05/2020.
//  Copyright © 2020 Filippo Minelle. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, StoryboardInstantiable {
	
	// MARK: - Views
	
	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelHotdesker: UILabel!
	@IBOutlet weak var textFieldHotdesker: UITextField! {
		didSet {
			textFieldHotdesker.delegate = self
		}
	}
	@IBOutlet weak var labelError: UILabel! {
		didSet {
			labelError.isHidden = true
			labelError.text = "You need to insert a valid name!"
		}
	}
	@IBOutlet weak var buttonFindASeat: UIButton! {
		didSet {
			buttonFindASeat.layer.cornerRadius = 12.0
			buttonFindASeat.setTitle("FIND A SEAT", for: .normal)
		}
	}
	
	// MARK: - Properties
	
	var viewModel: LoginViewModel = LoginViewModel()
	
	// Actions
	var findASeat: ((User) -> Void)?
	
	// MARK: - StoryboardInstantiable
	
	public class func istantiate() -> LoginViewController {
		let viewController = instanceFromStoryboard()
		return viewController
	}
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.hideKeyboardWhenTappedAround()
	}
	
	// MARK: - Actions
	
	@IBAction func actionButtonFindASeat(_ sender: UIButton) {
		guard (self.findASeat != nil) else {
			return
		}
		
		if let text = textFieldHotdesker.text {
			if (text.isEmpty) {
				labelError.isHidden = false
			} else {
				self.findASeat!(User.init(name: text))
			}
		}
	}
	
}

extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case textFieldHotdesker:
			textFieldHotdesker.resignFirstResponder()
		default:
			break
		}
		
		return true
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		labelError.isHidden = true
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		labelError.isHidden = true
	}
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		labelError.isHidden = true
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
}
