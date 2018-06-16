//
//  AppDelegate.swift
//  Dollar
//
//  Created by Andy Liang on 2017-10-22.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.registerNotifications()
		application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
		return true
	}
	
	func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
		CurrencyManager.shared.refresh { rate in
			guard let rate = rate, abs(rate.val - LastSaved.rate) >= 0.003 else {
				return completionHandler(.failed)
			}
			LastSaved.rate = rate.val
			let content = UNMutableNotificationContent()
			content.title = "Current Rate"
			content.body = "1 USD = \(rate.val) CAD"
			content.sound = .default
            content.categoryIdentifier = "ExchangeRate"
			// Deliver the notification at the set time
			let request = UNNotificationRequest(identifier: "\(rate.val)", content: content, trigger: nil)
			// Schedule the notification.
			UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
			completionHandler(.newData)
		}
	}
    
    private func registerNotifications() {
        let category = UNNotificationCategory(identifier: "ExchangeRate", actions: [], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: { _, _ in })
    }
	
}

