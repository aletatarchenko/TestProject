//
//  Data+Extension.swift
//
//  Created by Alexey Tatarchenko on 01.07.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import Foundation

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}
