//
//  CurrencyLastSaved.swift
//  Dollar
//
//  Created by Andy Liang on 2017-10-26.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct LastSaved {
	
	static var rate: Double {
		get {
			return UserDefaults.standard.double(forKey: "LastSaved.rate")
		} set {
			UserDefaults.standard.set(newValue, forKey: "LastSaved.rate")
		}
	}
	
}
