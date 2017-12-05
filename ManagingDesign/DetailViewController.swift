//  ManagingDesign
//  Created by Erwin Mazariegos on 11/27/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!

	var detailItem: String? {
		didSet {
			configureView()
		}
	}

	func configureView() {
		if let detail = detailItem, let label = detailDescriptionLabel {
	        label.text = numberSymbol(numberString: detail)
			Design.setDefaultFont(label: detailDescriptionLabel, weight: .light)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		view.backgroundColor = Design.AppViews.backgroundColor()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	func numberSymbol(numberString:String) -> String {
		switch numberString {
		case "Unus": 	return "I"
		case "Duo": 	return "II"
		case "Tres": 	return "III"
		case "Quattuor":return "IV"
		case "Quinque": return "V"
		case "Sex": 	return "VI"
		case "Septem": 	return "VII"
		case "Octo": 	return "VIII"
		case "Novem": 	return "IX"
		case "Decem": 	return "X"
		default: 		return "?"
		}

	}

}

