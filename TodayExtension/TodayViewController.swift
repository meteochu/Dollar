//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Andy Liang on 2017-10-25.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
	@IBOutlet weak var amountLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	private let currencyManager = CurrencyManager()
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
		self.dateLabel.text = "Current Status: Updating..."
		currencyManager.refresh { rate in
			if let rate = rate {
				self.amountLabel.text = "\(rate.val)"
				self.dateLabel.text = "Last Updated: \(rate.dateString)"
				completionHandler(.newData)
			} else {
				self.dateLabel.text = "Last Updated: Failed"
				completionHandler(.failed)
			}
		}
    }
    
}
