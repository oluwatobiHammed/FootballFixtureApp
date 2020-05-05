//
//  KSSpacingConfig.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public typealias KSFieldUpdateCallback = (_ field: KSField)-> Void

open class KSSpacingConfig {
    public var top: Double
    public var bottom: Double
    public var leading: Double
    public var trailing: Double
    public var height: Double?
    
    public init(top: Double = 10, bottom: Double = 0, leading: Double = 0, trailing: Double = 0, height: Double? = 40) {
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
        self.height = height
    }
    
}

public class KSFieldConstraints {
    public var fieldBottom: Constraint?
    public var fieldTop: Constraint?
    public var fieldLeading: Constraint?
    public var fieldTrailing: Constraint?
    public var fieldHeight: Constraint?
    
    
    public var ksFieldBottom: Constraint?
    
    public var extraConstraints: [String: Constraint] = [:]
    
    func uninstallFieldsConstraint() {
        fieldBottom?.deactivate()
        fieldTrailing?.deactivate()
        fieldTop?.deactivate()
        fieldLeading?.deactivate()
        ksFieldBottom?.deactivate()
        
        fieldBottom = nil
        fieldTrailing = nil
        fieldTop = nil
        fieldLeading = nil
        ksFieldBottom = nil
    }
}

public enum KSFormValueAlignment: String {
    case leading = "leading"
    case trailing = "trailing"
    case center = "center"
    case justified = "justified"
    
    public var nsTextAlignment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .leading:
            return .left
        case .trailing:
            return .right
        case .justified:
            return .justified
        }
    }
}

open class KSField: UIView {
    fileprivate var isBuilt = false
    fileprivate var isFormatted = false
    
    public var fieldTitleView: UILabel?
    public var fieldSetupCallback: KSFieldUpdateCallback?
    public var fieldFormatCallback: KSFieldUpdateCallback?
    
    public var callGlobalFormatter = true
    public var callGlobalSetup = true
    
    public var useGlobalObject: KSFormGlobal? = KSFormGlobal.shared
    
    public var titleSpacing = KSFormGlobal.shared.defaultTitleSpacing
    public var fieldSpacing = KSFormGlobal.shared.defaultInputSpacing
    
    public var constraintsHolder = KSFieldConstraints()
    
    public var postFieldBuilt: ((_ field: KSField) -> Void)?
    public var preFieldBuild: ((_ field: KSField) -> Void)?
    
    public var extraData: [String: Any] = [:]
    
    //public var addons: [KSFieldAddon] = []
    
    @IBInspectable
    public var fieldName: String?
    
    @IBInspectable
    public var fieldTitle: String? {
        didSet {
            if isFormatted {
                self.formatField()
            }
        }
    }
    
    @IBInspectable var showRequiredIndicator: Bool = true {
        didSet {
            if isFormatted {
                self.formatField()
            }
        }
    }
    
    @IBInspectable
    public var isRequired: Bool = false{
        didSet {
            if isFormatted {
                self.formatField()
            }
        }
    }
    
    @IBInspectable
    public var placeholder: String? {
        didSet {
            if isFormatted {
                self.formatField()
            }
        }
    }
    
    @IBInspectable
    public var valueAlignmentType: String? {
        didSet {
            if let alignment = KSFormValueAlignment(rawValue: valueAlignmentType ?? "") {
                self.valueAlignment = alignment
            }
            else{
                self.valueAlignment = .leading
            }
        }
    }
    
    public var valueAlignment: KSFormValueAlignment = .leading {
        didSet {
            if isFormatted {
                self.formatField()
            }
        }
    }
    
    open func setupField() {
        if let label = getFieldTitle() {
            self.setupForFieldWithLabel(label: label)
        }
        else{
            self.setupForFieldWithoutLabel()
        }
        self.setupFieldItem()
        
        if let global = useGlobalObject {
            if callGlobalSetup {
                global.fieldSetupCallback?(self)
            }
        }
        self.fieldSetupCallback?(self)
    }
    
    open func setupFieldItem() {
        
    }
    
    open func setupForFieldWithoutLabel() {
        let input = getInteractiveFieldView()
        self.addSubview(input)
        self.constraintsHolder.uninstallFieldsConstraint()
        input.snp.makeConstraints { (make) in
            self.constraintsHolder.fieldTop = make.top.equalToSuperview().offset(fieldSpacing.top).constraint
            self.constraintsHolder.fieldLeading = make.leading.equalToSuperview().offset(fieldSpacing.leading).constraint
            self.constraintsHolder.fieldTrailing = make.trailing.equalToSuperview().offset(0 - fieldSpacing.trailing).constraint
            self.constraintsHolder.fieldBottom = make.bottom.equalToSuperview().offset(0 - fieldSpacing.bottom).constraint
            self.constraintsHolder.ksFieldBottom = self.constraintsHolder.fieldBottom
            if let height = fieldSpacing.height {
                self.constraintsHolder.fieldHeight = make.height.equalTo(height).constraint
            }
        }
        
    }
    
    open func setupForFieldWithLabel(label: UIView) {
        let input = getInteractiveFieldView()
        
        self.addSubview(label)
        self.addSubview(input)
        self.constraintsHolder.uninstallFieldsConstraint()
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(titleSpacing.top)
            make.leading.equalToSuperview().offset(titleSpacing.leading)
            make.trailing.equalToSuperview().offset(titleSpacing.trailing)
        }
        input.snp.makeConstraints { (make) in
            self.constraintsHolder.fieldTop = make.top.equalTo(label.snp.bottom).offset(fieldSpacing.top).constraint
            self.constraintsHolder.fieldLeading = make.leading.equalToSuperview().offset(fieldSpacing.leading).constraint
            self.constraintsHolder.fieldTrailing = make.trailing.equalToSuperview().offset(0 - fieldSpacing.trailing).constraint
            self.constraintsHolder.fieldBottom = make.bottom.equalToSuperview().offset(0 - fieldSpacing.bottom).constraint
            self.constraintsHolder.ksFieldBottom = self.constraintsHolder.fieldBottom
            if let height = fieldSpacing.height {
                self.constraintsHolder.fieldHeight = make.height.equalTo(height).constraint
            }
        }
        
    }
    
    
    
    public func formatField() {
        if let label = getFieldTitle(){
            self.formatLabel(view: label)
        }
        self.formatFieldItem()
        
        if let global = useGlobalObject {
            if callGlobalFormatter {
                global.fieldFormatCallback?(self)
            }
        }
        self.fieldFormatCallback?(self)
    }
    
    
    open func formatLabel(view: UIView) {
        
    }
    
    open func formatFieldItem() {
        
    }
    
    
    
    open func getFieldTitle()-> UIView? {
        if let view = fieldTitleView {
            return view
        }
        if var title = fieldTitle {
            let label = UILabel()
            if isRequired {
                title += " *"
            }
            label.text = title
            fieldTitleView = label
            label.textAlignment = valueAlignment.nsTextAlignment
        }
        return fieldTitleView
    }
    
    public func build() {
        self.backgroundColor = UIColor.clear
        self.preFieldBuild?(self)
        self.setupField()
        self.formatField()
//        self.addons.forEach { (addon) in
//            addon.bindToField(field: self)
//            addon.buildAddon()
//        }
        self.postFieldBuilt?(self)
        isFormatted = true
        isBuilt = true
    }
    
    open func getInteractiveFieldView()-> UIView {
        return UIView()
    }
    
    open func getFieldValue()-> Any? {
        return nil
    }
    
    open func getFieldValueAsString()-> String? {
        return nil
    }
    
    open func activateField() {
        
    }
    
    open func fieldValueDidChange() {
        self.formatField()
    }
}
