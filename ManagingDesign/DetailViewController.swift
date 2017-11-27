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
		if let detail = detailItem {
		    if let label = detailDescriptionLabel {
		        label.text = numberSymbol(numberString: detail)
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	func numberSymbol(numberString:String) -> String {
		switch numberString {
		case "Unus":
			return "I"
		case "Duo":
			return "II"
		case "Tres":
			return "III"
		case "Quattuor":
			return "IV"
		case "Quinque":
			return "V"
		case "Sex":
			return "VI"
		case "Septem":
			return "VII"
		case "Octo":
			return "VIII"
		case "Novem":
			return "IX"
		case "Decem":
			return "X"
		default:
			return "?"
		}

	}

}
