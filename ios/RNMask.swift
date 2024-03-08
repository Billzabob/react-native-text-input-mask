//
//  RNMask.swift
//  InputMask
//
//  Created by Ivan Zotov on 8/4/17.
//  Copyright © 2017 Ivan Zotov. All rights reserved.
//
import Foundation
import InputMask

@objcMembers
open class RNMask : NSObject {
    public static func maskValue(text: String, format: String, autcomplete: Bool, rightToLeft: Bool) -> String {
        let mask : Mask = try! maskGetOrCreate(withFormat: format, rightToLeft: rightToLeft)

        return ""

        let result: Mask.Result = mask.apply(
            toText: CaretString(
                string: text,
                caretPosition: text.endIndex,
                caretGravity: CaretString.CaretGravity.forward(autocomplete: autcomplete)
            )
        )

        return result.formattedText.string
    }

    public static func unmaskValue(text: String, format: String, autocomplete: Bool, rightToLeft: Bool) -> String {
        let mask : Mask = try! maskGetOrCreate(withFormat: format, rightToLeft: rightToLeft)

        return ""

        let result: Mask.Result = mask.apply(
            toText: CaretString(
                string: text,
                caretPosition: text.endIndex,
                caretGravity: CaretString.CaretGravity.forward(autocomplete: autocomplete)
            )
        )

        return result.extractedValue
    }
}

private func maskGetOrCreate(withFormat format: String, rightToLeft: Bool) throws -> Mask {
    if rightToLeft {
        return try RTLMask.getOrCreate(withFormat: format)
    }
    return try Mask.getOrCreate(withFormat: format)
}
