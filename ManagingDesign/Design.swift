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

	// MARK: - Private Constants
	private enum Colors {
		case accent, text, lightText, clear, white, lightObscuring, error, background, headerBackground
		
		func uiColor() -> UIColor {
			switch self {
			case .accent:		return UIColor(red:   0/255, green: 181/255, blue: 255/255, alpha: 1)
			case .text:			return UIColor(red:   0/255, green:   0/255, blue: 100/255, alpha: 1)
			case .lightText:	return UIColor(red: 193/255, green: 193/255, blue: 255/255, alpha: 0.75)
			case .clear:		return UIColor.clear
			case .white:		return UIColor.white
			case .lightObscuring:return UIColor(red:  80/255, green:  80/255, blue:  90/255, alpha: 0.5)
			case .error:		return UIColor.red
			case .background:	return UIColor(patternImage: BackgroundImages.view.uiImage())
			case .headerBackground:	return UIColor(patternImage: BackgroundImages.header.uiImage()).withAlphaComponent(0.75)
			}
		}
	}
	
	private enum BackgroundImages {
		case view, header
		
		func uiImage() -> UIImage {
			switch self {
			case .view:		if let image = UIImage(named: "background")	{ return image }
			case .header:	if let image = UIImage(named: "header")		{ return image }
			}
			return UIImage()
		}
	}
	
	private enum Fonts: String {
		case light_48, light_36,
		lightItalic_18, lightItalic_14,
		italic_15, italic_13,
		bold_17,
		regular_16, regular_13

		func uiFont() -> UIFont {
			switch self {
			case .light_48: 	if let font = UIFont(name: "Lato-Light", 	size: 48.0) 	{ return font }
			case .light_36: 	if let font = UIFont(name: "Lato-Light", 	size: 36.0) 	{ return font }

			case .lightItalic_18: if let font = UIFont(name: "Lato-LightItalic", size: 18.0) { return font }
			case .lightItalic_14: if let font = UIFont(name: "Lato-LightItalic", size: 14.0) { return font }

			case .italic_15: 	if let font = UIFont(name: "Lato-Italic", 	size: 15.0) 	{ return font }
			case .italic_13: 	if let font = UIFont(name: "Lato-Italic", 	size: 13.0) 	{ return font }

 			case .bold_17: 		if let font = UIFont(name: "Lato-Bold", 	size: 17.0) 	{ return font }

			case .regular_16: 	if let font = UIFont(name: "Lato-Regular", 	size: 16.0) 	{ return font }
			case .regular_13: 	if let font = UIFont(name: "Lato-Regular", 	size: 13.0) 	{ return font }
			}
			return .systemFont(ofSize: 14)
		}
	}
}

