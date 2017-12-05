//  ManagingDesign
//  Created by Erwin Mazariegos on 12/4/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import UIKit

extension Design {

	enum Themes: String {
		case light, dark
	}

	enum Colors: String {
		case accent, text, lightText, clear, white, lightObscuring, error, background, headerBackground

		func uiColor(_ theme: Themes? = nil) -> UIColor {
			guard let color = DesignConfig(theme).colors[self.rawValue] else {
				fatalError("Specified color not in config: \(self.rawValue)")
			}
			return color
		}
	}

	enum BackgroundImages: String {
		case view, header

		func uiImage(theme: Themes? = nil) -> UIImage {
			guard let image = DesignConfig(theme).backgroundImages[self.rawValue] else {
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

		func uiFont(theme: Themes? = nil) -> UIFont {
			guard let font = DesignConfig(theme).fonts[self.rawValue] else {
				fatalError("Specified font not in config: \(self.rawValue)")
			}
			return font
		}
	}

	private struct DesignConfig {

		var colors = [String:UIColor]()
		var backgroundImages = [String:UIImage]()
		var fonts = [String:UIFont]()

		init() {
			colors["accent"] = 			UIColor(red:   0/255, green: 181/255, blue: 255/255, alpha: 1)
			colors["text"] = 			UIColor(red:   0/255, green:   0/255, blue: 100/255, alpha: 1)
			colors["lightText"] = 		UIColor(red: 193/255, green: 193/255, blue: 255/255, alpha: 0.75)
			colors["clear"] = 			UIColor(red:   0/255, green:   0/255, blue:   0/255, alpha: 0)
			colors["white"] = 			UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
			colors["lightObscuring"] = 	UIColor(red:  80/255, green:  80/255, blue:  90/255, alpha: 0.5)
			colors["error"] = 			UIColor(red: 255/255, green:   0/255, blue:   0/255, alpha: 1)
			colors["background"] = 		UIColor(patternImage: UIImage(named: "background") ?? UIImage())
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

		init(_ theme: Themes?) {

			if let theme = theme {
				let file = "\(theme.rawValue)theme.json"
				print(file)	// silences unused variable warning

				// TODO: read and parse json file, create DesignConfig object based on values
				// color: rgba values
				// images: image names as string
				// fonts: font-name, size
				self.init()

			} else {
				self.init()
			}

		}

	}

}


