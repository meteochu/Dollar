//
//  CurrencyManager.swift
//  Dollar
//
//  Created by Andy Liang on 2017-10-22.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

private let apiKey = "e79aa1dc3e084c32b6ea"
struct CurrencyManager {
	
	static let shared = CurrencyManager()
	
	private static let requestUrl = URL(string: "https://free.currencyconverterapi.com/api/v5/convert?q=USD_CAD&compact=y&apiKey=\(apiKey)")!
	
	func refresh(completion: @escaping (CurrencyResult?) -> Void) {
		let dataTask = URLSession.shared.dataTask(with: CurrencyManager.requestUrl) { data, response, error in
			if let data = data {
				let decoder = JSONDecoder()
				do {
					let response = try decoder.decode(CurrencyResponse.self, from: data)
					completion(response.exchange)
				} catch {
					print(error)
					completion(nil)
				}
			}
		}
		
		DispatchQueue.global(qos: .background).async {
			dataTask.resume()
		}
	}
	
}
