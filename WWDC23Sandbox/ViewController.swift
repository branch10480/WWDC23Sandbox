//
//  ViewController.swift
//  WWDC23Sandbox
//
//  Created by Toshiharu Imaeda on 2023/07/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var dataSource: UITableViewDiffableDataSource<Section, Item>!

    private enum Section: String {
        case main
    }

    private enum Item: Int {
        case sfSymbolAnimation

        var title: String {
            switch self {
            case .sfSymbolAnimation: return "SFSymbol Animation"
            }
        }
    }

    private var menu: [Item] = [
        .sfSymbolAnimation
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension ViewController {
    func setup() {
        setupDataSource()
        tableView.delegate = self
        apply(menu: menu)
    }

    func setupDataSource() {
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            var configuration = cell.defaultContentConfiguration()
            configuration.text = itemIdentifier.title
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
            return cell
        })
    }

    private func apply(menu: [ViewController.Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(menu)
        dataSource.apply(snapshot)
    }

    private func pushVC(item: Item?) {
        guard let item else { return }
        switch item {
        case .sfSymbolAnimation:
            let vc = SFSymbolAnimationViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        pushVC(item: dataSource.itemIdentifier(for: indexPath))
    }
}

