//  ManagingDesign
//  Created by Erwin Mazariegos on 12/4/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import UIKit

protocol ConfigurableTheme {
	var colors: [String:UIColor] { get }
	var backgroundImages: [String:UIImage] { get }
	var fonts: [String:UIFont] { get }
}

extension Design {

	enum Themes: String {
		case light, dark
	}

	enum Colors: String {
		case accent, text, lightText, clear, white, lightObscuring, error, background, headerBackground

		func uiColor(_ theme: Themes? = Design.currentTheme) -> UIColor {
			guard let color = configuredTheme(theme: theme).colors[self.rawValue] else {
				fatalError("Specified color not in config: \(self.rawValue)")
			}
			return color
		}
	}

	enum BackgroundImages: String {
		case view, header

		func uiImage(theme: Themes? = Design.currentTheme) -> UIImage {
			guard let image = configuredTheme(theme: theme).backgroundImages[self.rawValue] else {
				fatalError("Specified image not in config: \(self.rawValue)")
			}
			return image
		}
	}

	enum Fonts: String {
		case light_48, light_36,
		lightItalic_18, lightItalic_14,
		italic_15, italic_13,
		bold_17,
		regular_16, regular_13

		func uiFont(theme: Themes? = Design.currentTheme) -> UIFont {
			guard let font = configuredTheme(theme: theme).fonts[self.rawValue] else {
				fatalError("Specified font not in config: \(self.rawValue)")
			}
			return font
		}
	}

	private static func configuredTheme(theme: Themes?) -> ConfigurableTheme {

		guard let theme = theme else {
			fatalError("Requested Theme cannot be nil")
		}

		switch theme {
		case .light:
			return LightTheme()
		case .dark:
			return DarkTheme()
		}
	}

	private struct DarkTheme: ConfigurableTheme {

		var colors = [String:UIColor]()
		var backgroundImages = [String:UIImage]()
		var fonts = [String:UIFont]()

		init() {
			colors["accent"] = 			UIColor(red:   0/255, green: 181/255, blue: 255/255, alpha: 1)
			colors["text"] = 			UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
			colors["lightText"] = 		UIColor(red: 193/255, green: 193/255, blue: 255/255, alpha: 0.75)
			colors["clear"] = 			UIColor(red:   0/255, green:   0/255, blue:   0/255, alpha: 0)
			colors["white"] = 			UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
			colors["lightObscuring"] = 	UIColor(red:  80/255, green:  80/255, blue:  90/255, alpha: 0.5)
			colors["error"] = 			UIColor(red: 255/255, green:   0/255, blue:   0/255, alpha: 1)
			colors["background"] = 		UIColor(red:   5/255, green:   5/255, blue:  55/255, alpha: 1)
			colors["headerBackground"] = UIColor(patternImage: UIImage(named: "header") ?? UIImage()).withAlphaComponent(0.75)

			backgroundImages["view"] = 	UIImage(named: "background")	?? UIImage()
			backgroundImages["header"] = UIImage(named: "header")		?? UIImage()

			let substituteFont = UIFont.systemFont(ofSize: 14)

			fonts["light_48"] = 	UIFont(name: "Lato-Light", 	size: 48.0) ?? substituteFont
			fonts["light_36"] = 	UIFont(name: "Lato-Light", 	size: 36.0) ?? substituteFont

			fonts["lightItalic_18"] = UIFont(name: "Lato-LightItalic", size: 18.0) ?? substituteFont
			fonts["lightItalic_14"] = UIFont(name: "Lato-LightItalic", size: 14.0) ?? substituteFont

			fonts["italic_15"] = 	UIFont(name: "Lato-Italic", size: 15.0) ?? substituteFont
			fonts["italic_13"] = 	UIFont(name: "Lato-Italic", size: 13.0) ?? substituteFont

			fonts["bold_17"] = 		UIFont(name: "Lato-Bold", 	size: 17.0) ?? substituteFont

			fonts["regular_16"] = 	UIFont(name: "Lato-Regular", size: 16.0) ?? substituteFont
			fonts["regular_13"] = 	UIFont(name: "Lato-Regular", size: 13.0) ?? substituteFont
		}

		init(_ jsonFile: String) {
			// TODO: read and parse json file, create DesignConfig object based on values
			// color: rgba values, or "pattern" and alpha value
			// images: image names as string
			// fonts: font-name, size
		}

	}

	private struct LightTheme: ConfigurableTheme {

		var colors = [String:UIColor]()
		var backgroundImages = [String:UIImage]()
		var fonts = [String:UIFont]()

		init() {
			colors["accent"] = 			UIColor(red:   0/255, green: 181/255, blue: 255/255, alpha: 1)
			colors["text"] = 			UIColor(red:   5/255, green:   5/255, blue:  55/255, alpha: 1)
			colors["lightText"] = 		UIColor(red: 193/255, green: 193/255, blue: 255/255, alpha: 0.75)
			colors["clear"] = 			UIColor(red:   0/255, green:   0/255, blue:   0/255, alpha: 0)
			colors["white"] = 			UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
			colors["lightObscuring"] = 	UIColor(red:  80/255, green:  80/255, blue:  90/255, alpha: 0.5)
			colors["error"] = 			UIColor(red: 255/255, green:   0/255, blue:   0/255, alpha: 1)
			colors["background"] = 		UIColor(red: 255/255, green: 150/255, blue: 150/255, alpha: 1)
			colors["headerBackground"] = UIColor(patternImage: UIImage(named: "header") ?? UIImage()).withAlphaComponent(0.75)

			backgroundImages["view"] = 	UIImage(named: "background")	?? UIImage()
			backgroundImages["header"] = UIImage(named: "header")		?? UIImage()

			let substituteFont = UIFont.systemFont(ofSize: 14)

			fonts["light_48"] = 	UIFont(name: "Lato-Light", 	size: 48.0) ?? substituteFont
			fonts["light_36"] = 	UIFont(name: "Lato-Light", 	size: 36.0) ?? substituteFont

			fonts["lightItalic_18"] = UIFont(name: "Lato-LightItalic", size: 18.0) ?? substituteFont
			fonts["lightItalic_14"] = UIFont(name: "Lato-LightItalic", size: 14.0) ?? substituteFont

			fonts["italic_15"] = 	UIFont(name: "Lato-Italic", size: 15.0) ?? substituteFont
			fonts["italic_13"] = 	UIFont(name: "Lato-Italic", size: 13.0) ?? substituteFont

			fonts["bold_17"] = 		UIFont(name: "Lato-Bold", 	size: 17.0) ?? substituteFont

			fonts["regular_16"] = 	UIFont(name: "Lato-Regular", size: 16.0) ?? substituteFont
			fonts["regular_13"] = 	UIFont(name: "Lato-Regular", size: 13.0) ?? substituteFont
		}

		init(_ jsonFile: String) {
			// TODO: read and parse json file, create DesignConfig object based on values
			// color: rgba values, or "pattern" and alpha value
			// images: image names as string
			// fonts: font-name, size
		}

	}

}


