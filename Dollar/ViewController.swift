//
//  ViewController.swift
//  Dollar
//
//  Created by Andy Liang on 2017-10-22.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var exchangedLabel: UILabel!
	
	@IBOutlet weak var lastUpdatedLabel: UILabel!
	
	@IBOutlet weak var textField: UITextField!
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	var amount: Double = 1.0 {
		didSet {
			self.exchangedLabel.text = "\(amount * currentRate)"
		}
	}
	
	var currentRate: Double = 1.0 {
		didSet {
			self.exchangedLabel.text = "\(amount * currentRate)"
		}
	}
	
	var rate: CurrencyResult! {
		didSet {
			self.currentRate = rate.val
			self.lastUpdatedLabel.text = "Last Updated: \(rate.dateString)"
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
		self.view.addGestureRecognizer(recognizer)
		self.refresh()
	}
	
	@objc func didTapView() {
		self.textField?.resignFirstResponder()
	}

	@IBAction func refreshCurrencyExchange(_ sender: Any) {
		self.refresh()
	}
	
	@IBAction func baseAmountDidChange(_ sender: UITextField) {
		if let text = sender.text, let amount = Double(text) {
			self.amount = amount
		}
	}
	
	func refresh() {
		CurrencyManager.shared.refresh { rate in
			guard let rate = rate else { return }
			DispatchQueue.main.async {
				self.rate = rate
			}
		}
	}
	
}

