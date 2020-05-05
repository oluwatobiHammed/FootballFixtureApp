//
//  KSFormGlobal.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

public class KSFormGlobal {
    public static let shared = KSFormGlobal()
    public var fieldSetupCallback: KSFieldUpdateCallback?
    public var fieldFormatCallback: KSFieldUpdateCallback?
    
    public var defaultTitleSpacing = KSSpacingConfig(top: 0, leading: 5)
    public var defaultInputSpacing = KSSpacingConfig(top: 5, leading: 5)
    public var defaultSelectInteractiveSpacing = KSSpacingConfig(top: 5, bottom: 5, leading: 5, trailing: 15)
    
    // Note that is does not affect the fist field on the row. It only affects subsequent fields, which means only the TOP attribute is used
    public var verticalFieldSpacing = KSSpacingConfig(top: 15, bottom: 0)
    // Note that is does not affect the fist field on the row. It only affects subsequent fields, which means only the LEADING attribute is used
    public var horizontalFieldSpacing = KSSpacingConfig(leading: 15, trailing: 0)
    
    // Note that this not not affect the first row, it only affects subsequent rows, which means only the TOP attribute is used
    public var rowSpacing = KSSpacingConfig(top: 20, bottom: 0)
}
