//
//  CurrencyResponse.swift
//  Dollar
//
//  Created by Andy Liang on 2017-10-22.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

struct CurrencyResult: Decodable {
	
	static let formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .none
		return formatter
	}()
	
	let val: Double
	let date = Date()
	
	var dateString: String {
		return CurrencyResult.formatter.string(from: date)
	}
	
}

struct CurrencyResponse: Decodable {
	
	let exchange: CurrencyResult
	
	enum CodingKeys: String, CodingKey {
		case exchange = "USD_CAD"
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.exchange = try values.decode(CurrencyResult.self, forKey: .exchange)
	}
	
}
