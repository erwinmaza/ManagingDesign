//  Design.swift
//  Created by Erwin Mazariegos on 11/27/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import Foundation
import UIKit

struct Design {
	
	struct AppViews {
		static let backgroundColor = UIColor(patternImage: BackgroundImages.view.uiImage())
		static let labelFont = Fonts.title.uiFont()
		static let statsFont = Fonts.stats.uiFont()
		static let statsBoldFont = Fonts.statsBold.uiFont()
		static let textColor = Colors.text.uiColor()
		static let textLightColor = Colors.lightText.uiColor()
		static let pagePathSeparator = " 👉 "
	}
	
	struct AppTables {
		static let backgroundColor = Colors.clear.uiColor()
	}
	
	struct LoadingView {
		static let backgroundColor = Colors.lightObscuring.uiColor()
		static let image = BackgroundImages.loading.uiImage()
		static let imageSize: CGFloat = 40
		static let imageAlpha: CGFloat = 0.5
	}
	
	struct ErrorView {
		static let textColor = Colors.error.uiColor()
	}
	
	struct TableCell {
		static let headerLabelFont = Fonts.cellHeader.uiFont()

		static let titleLabelColor = Colors.text.uiColor()
		static let titleLabelFont = Fonts.cellTitle.uiFont()
		
		static let statsLabelColor = Colors.lightText.uiColor()
		static let statsLabelFont = Fonts.stats.uiFont()
		static let statsLabelWidth: CGFloat = 80
		
		static let labelPadding: CGFloat = 5
		static let backgroundColor = Colors.clear.uiColor()
	}
	
	struct DateTimeFormats {
		static let dateTime = "MMM dd, yyyy hh:mm a"
		static let timeZone = "z"
	}
	
	static func attributedStringFor(sequence: String) -> NSAttributedString {
		let delimeter = "/"
		if sequence.contains(delimeter) {
			let joiner = NSAttributedString(string: Separators.hand.symbol(), attributes: statsBoldAttibutes)
			var strings = [NSAttributedString]()

			let paths = sequence.components(separatedBy: Separators.hand.symbol())
			for path in paths {
				if path.contains(delimeter) {
					let pathString = NSMutableAttributedString(string: path, attributes: statsBoldAttibutes)
					let lastMatch = path.range(of: delimeter, options: .backwards)
					pathString.setAttributes(statsLightAttibutes, range: NSMakeRange(0, path.distance(from: path.startIndex, to: (lastMatch?.upperBound)!)))
					strings.append(pathString)
				} else {
					strings.append(NSAttributedString(string: path, attributes: statsBoldAttibutes))
				}
			}
			
			let fullString = NSMutableAttributedString(attributedString: strings[0])
			fullString.append(joiner)
			fullString.append(strings[1])
			fullString.append(joiner)
			fullString.append(strings[2])
			return fullString
		} else {
			return NSAttributedString(string: sequence, attributes: statsBoldAttibutes)
		}
	}
	
	private static let statsBoldAttibutes = [
		NSAttributedStringKey.font: AppViews.statsBoldFont,
		NSAttributedStringKey.foregroundColor: AppViews.textColor
	]
	
	private static let statsLightAttibutes = [
		NSAttributedStringKey.font: AppViews.statsFont,
		NSAttributedStringKey.foregroundColor: AppViews.textLightColor
	]
	
	private enum Colors {
		case accent, text, lightText, clear, white, lightObscuring, error
		
		func uiColor() -> UIColor {
			switch self {
			case .accent:		return UIColor(red:   0/255, green: 181/255, blue: 255/255, alpha: 1)
			case .text:			return UIColor(red:   0/255, green:   0/255, blue:   0/255, alpha: 1)
			case .lightText:	return UIColor(red:  93/255, green:  93/255, blue:  93/255, alpha: 1)
			case .clear:		return UIColor.clear
			case .white:		return UIColor.white
			case .lightObscuring:return UIColor(red:  80/255, green:  80/255, blue:  90/255, alpha: 0.5)
			case .error:		return UIColor.red
			}
		}
	}
	
	private enum BackgroundImages {
		case view, logo, loading
		
		func uiImage() -> UIImage {
			switch self {
			case .view:		if let image = UIImage(named: "view_background")	{ return image }
			case .logo:		if let image = UIImage(named: "apache_logo")		{ return image }
			case .loading:	if let image = UIImage(named: "apache_logo")		{ return image }
			}
			return UIImage()
		}
	}
	
	private enum Fonts {
		case title, stats, statsBold, cellHeader, cellTitle, cellDetail
		
		func uiFont() -> UIFont {
			switch self {
			case .title: return UIFont.systemFont(ofSize: 14, weight: .light)
			case .stats: return UIFont.italicSystemFont(ofSize: 9)
			case .statsBold: return UIFont.italicSystemFont(ofSize: 11)
			case .cellHeader: if let font = UIFont(name: "GillSans-BoldItalic", size: 15) { return font }
			case .cellTitle: if let font = UIFont(name: "GillSans", size: 12) { return font }
			case .cellDetail: if let font = UIFont(name: "GillSans", size: 9) { return font }
			}
			return UIFont()
		}
	}

	private enum Separators {
		case hand, clap, oogle, wavy, musical, arrow

		func symbol() -> String {
			switch self {
			case .hand: 	return " 👉🏼 "
			case .clap: 	return " 👏🏼 "
			case .oogle: 	return " 👀 "
			case .wavy: 	return " 〰️ "
			case .musical: 	return " 🎶 "
			case .arrow: 	return " ➤ "
			}

		}

	}
	
}

