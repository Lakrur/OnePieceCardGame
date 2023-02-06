//
//  Func's.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 07.02.2023.
//

import UIKit

func formatNumber(number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.groupingSeparator = ","
    let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
    return formattedNumber ?? ""
}
