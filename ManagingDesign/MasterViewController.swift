//  ManagingDesign
//  Created by Erwin Mazariegos on 11/27/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	let cellIdentifier = "Cell"
	let segueIdentifier = "showDetail"

	var detailViewController: DetailViewController? = nil
	var latinNumbers = ["Unus", "Duo", "Tres", "Quattuor", "Quinque", "Sex", "Septem", "Octo", "Novem", "Decem"]

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.leftBarButtonItem = editButtonItem

		setUI()

		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

		self.title = "Pick a number"
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}

	}

	override func viewWillAppear(_ animated: Bool) {
		if let selectedIndex = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: selectedIndex, animated: false)
		}
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		switch editing {
		case true:
			Design.currentTheme = .light
		case false:
			Design.currentTheme = .dark
		}
		setUI()
		tableView.reloadData()
	}

	func setUI() {
		view.backgroundColor = Design.AppViews.backgroundColor()
		tableView.backgroundColor = Design.AppTables.backgroundColor()
		tableView.separatorColor = Design.AppTables.separatorColor()
		navigationController?.navigationBar.setBackgroundImage(Design.AppViews.navigationBackgroundImage(), for: .default)
		navigationController?.navigationBar.tintColor = Design.AppViews.navigationTint()
	}

	// MARK: - Segues
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == segueIdentifier {
		    if let indexPath = tableView.indexPathForSelectedRow {
		        let object = latinNumbers[indexPath.row]
		        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
		        controller.detailItem = object
		        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}

	// MARK: - Table View
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return latinNumbers.count
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 32
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let leftPadding = tableView.separatorInset.left

		let label = UILabel(frame: CGRect(x: leftPadding, y: 0, width: tableView.frame.size.width - leftPadding, height: 32))
		label.text = "Latin Numbers"
		Design.setDefaultFont(label: label, weight: .bold, size: 17)

		let view = UIView()
		view.backgroundColor = Design.AppTables.TableHeader.backgroundColor()
		view.addSubview(label)
		return view
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		cell.backgroundColor = Design.AppTables.TableCell.backgroundColor()

		if let label = cell.textLabel {
			label.text = latinNumbers[indexPath.row]
			Design.setDefaultFont(label: label, font: Design.AppTables.TableCell.titleLabelFont())
		}
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: segueIdentifier, sender: self)
	}

}

