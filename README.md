# Dollar

Just a tiny app that fetches currency exchange rates 

## What it does?

Dollar just fetches the current currency exchange rate between USD and CAD, and periodically fetches the exchange rate in the background and sends notifications when the exchange rate differs by 0.003 of the last fetched rate. There's also a Today Extension that shows the live exchange rate too.

## Why?

Wanted to monitor the currency exchange for USD and CAD easily with minimal network traffic 

## Using other exchange rates

Just go into `CurrencyManager.swift` and modify the request url:

```swift
// Change the USD_CAD to your desired exchange symbol
private static let requestUrl = URL(string: "https://free.currencyconverterapi.com/api/v5/convert?q=USD_CAD&compact=y")!
```

Then, go to `CurrencyResponse.swift` and do something similar. In `CurrentResponse.CodingKeys`, change the rawValue of `exchange` to the same exchange symbol from the CurrencyManager file.
```swift
enum CodingKeys: String, CodingKey {
  case exchange = "USD_CAD" // change this
}
```

## LICENSE 

The MIT License (MIT)

Copyright (c) 2018 Andy Liang

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
