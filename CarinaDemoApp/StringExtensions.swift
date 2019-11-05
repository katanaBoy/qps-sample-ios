//
//  StringExtensions.swift
//  CarinaDemoApp
//
//  Created by Alexander Pokynchereda on 15.10.2019.
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, tableName: "Localizable", value: "**\(self)**", comment: "")
  }
  
  func localizeWithFormat(arguments: CVarArg...) -> String{
    return String(format: self.localized, arguments: arguments)
  }
}
