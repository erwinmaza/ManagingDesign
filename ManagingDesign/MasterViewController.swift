//  ManagingDesign
//  Created by Erwin Mazariegos on 11/27/17.
//  Copyright (c) 2017 eMaza Mobile. All rights reserved.

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	var latinNumbers = ["Unus", "Duo", "Tres", "Quattuor", "Quinque", "Sex", "Septem", "Octo", "Novem", "Decem"]

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.leftBarButtonItem = editButtonItem
		navigationController?.navigationBar.setBackgroundImage(Design.AppViews.backgroundImage, for: .default)
		navigationController?.navigationBar.tintColor = Design.AppViews.navigationTint

		tableView.backgroundColor = Design.AppTables.backgroundColor
		tableView.separatorColor = Design.AppTables.separatorColor

		self.title = "Pick a number"
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	// MARK: - Segues
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
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
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return latinNumbers.count
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 32
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let leftPadding = tableView.separatorInset.left

		let label = UILabel(frame: CGRect(x: leftPadding, y: 0, width: tableView.frame.size.width - leftPadding, height: 32))
		label.text = "Latin Numbers"
		Design.setDefaultFont(label: label, weight: .bold, size: 17)

		let view = UIView()
		view.backgroundColor = Design.AppTables.TableHeader.backgroundColor
		view.addSubview(label)
		return view
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.backgroundColor = Design.AppTables.TableCell.backgroundColor

		if let label = cell.textLabel {
			label.text = latinNumbers[indexPath.row]
			Design.setDefaultFont(label: label, font: Design.AppTables.TableCell.titleLabelFont)
		}
		return cell
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
		    latinNumbers.remove(at: indexPath.row)
		    tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
		}
	}

}

