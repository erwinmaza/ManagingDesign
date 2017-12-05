//  Design.swift
//  Created by Erwin Mazariegos on 11/27/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import Foundation
import UIKit

struct Design {
	
	struct AppViews {
		static let backgroundColor = Colors.background.uiColor()

		static let navigationTint = Colors.accent.uiColor()
		static let navigationBackgroundImage = BackgroundImages.header.uiImage()
	}
	
	struct AppTables {
		static let backgroundColor = Colors.background.uiColor()
		static let separatorColor = Colors.accent.uiColor()

		struct TableHeader {
			static let backgroundColor = Colors.headerBackground.uiColor()
		}

		struct TableCell {
			static let titleLabelColor = Colors.text.uiColor()
			static let titleLabelFont = Fonts.lightItalic_18.uiFont()

			static let labelPadding: CGFloat = 5
			static let backgroundColor = Colors.clear.uiColor()
		}
	}
	
	struct DateTimeFormats {
		static let dateTime = "MMM dd, yyyy hh:mm a"
	}
	
	enum FontWeights: String {
		case regular, light, bold, lightItalic, italic, black
	}

	/// Apply app-wide default font, color, kerning, etc; using size set in the label
	static func setDefaultFont(label: UILabel, weight: FontWeights) {
		let fontSize = Int(label.font.pointSize)
		setDefaultFont(label: label, weight: weight, size: fontSize)
	}

	/// Apply app-wide default font, color, kerning, etc; using specified size
	static func setDefaultFont(label: UILabel, weight: FontWeights, size: Int) {

		guard let fontEnum = Fonts(rawValue: "\(weight.rawValue)_\(size)") else {
			fatalError("Specified default font is not implemented. Weight: \(weight), size: \(size)")
		}

		setDefaultFont(label: label, font: fontEnum.uiFont())
	}

	static func setDefaultFont(label: UILabel, font: UIFont) {

		guard let text = label.text else {
			// In this app, all custom fonts get a special kerning value.
			// But if there are no NSAttributedString specific styles to apply, don't use NSAttributedStrings.
			// Instead, set properties on the UI lable, so that any .text assignments pick up the correct style.
			// Then this guard and warning become unneccesary.
			print("\n  *****    Warning: attempting to apply a style on nonexistent text.\n           Please set the label text first.\n")
			return
		}

		let defaultLabelAttributes: [NSAttributedStringKey : Any] = [
			.font: font,
			.foregroundColor: Colors.text.uiColor(),
			.kern: -0.3
		]

		let attributedText = NSAttributedString(string: text, attributes: defaultLabelAttributes)
		label.attributedText = attributedText
	}

}

