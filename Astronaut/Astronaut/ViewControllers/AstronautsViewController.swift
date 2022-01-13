//
//  AstronautsViewController.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import UIKit

enum SortBy : String {
    case name
    case nationality
}

enum SortType : String {
    case AZ
    case ZA
}

final class AstronautsViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var refreshControl: UIRefreshControl!
    private var sortBarItem: UIBarButtonItem!
    
    var astronautListViewModel : AstronautListViewModel!
    typealias ShowAstronautDetail = (AstronautViewModel) -> Void
    var didSelectAstronaut: ShowAstronautDetail?
    var sortBy: SortBy = .name
    var sortType: SortType = .AZ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = UIViewController.Title.astronauts.rawValue.localized
        
        setupRefreshControl()
        setupTableView()
        setupSortItem()
        
        // notify viewModel changes to UI via binding
        astronautListViewModel.astronautViewModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        astronautListViewModel.sortType.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.astronautListViewModel.performSort(by: self?.sortBy, type: self?.sortType)
                self?.setupSortItem() // update sortItem
            }
        }
        
        astronautListViewModel.fetchData()
    }
}

// MARK: TableView DataSource
extension AstronautsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return astronautListViewModel.astronautViewModels.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AstronautTableCell.self), for: indexPath) as? AstronautTableCell else {
            return UITableViewCell()
        }
        
        let astronautViewModel = astronautListViewModel.astronautViewModels.value?[indexPath.row]
        cell.configure(model: astronautViewModel!)
        return cell
    }
}

// MARK: TableView Delegate
extension AstronautsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // open detail screen
        guard let didSelectAstronaut = didSelectAstronaut else {
            return
        }
        
        guard let astronautViewModel = astronautListViewModel.astronautViewModels.value?[indexPath.row] else {
            return
        }
        didSelectAstronaut(astronautViewModel)
        
        // clear selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: UI setup
private extension AstronautsViewController {
    
    @objc func refresh(_ sender: AnyObject) {
        astronautListViewModel.fetchData()
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func setupTableView() {
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupSortItem() {
        if sortBarItem == nil {
            sortBarItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.sortBarItemTapped(_:)))
        }
        let sortText = sortBy.rawValue + " " + sortType.rawValue
        sortBarItem.title = sortText
        
        navigationItem.rightBarButtonItem = sortBarItem
    }
}

// MARK: Update Data Loading states
extension AstronautsViewController: LoadingDelegate {
    
    func updateLoading(state: LoadingState) {
        switch state {
        case .loading:
            refreshControl.beginRefreshing()
        case .failure(let error):
            showAlert(title: "error".localized, message: error?.localizedDescription)
            refreshControl.endRefreshing()
        case .success:
            refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

// MARK: Sort feature
private extension AstronautsViewController {
    
    @objc func sortBarItemTapped(_ sender: Any) {
        switch sortType {
        case .AZ:
            sortType = .ZA
        case .ZA:
            sortType = .AZ
        }
        // For now can only order by name, but in the future can easily show bottomsheet with list of properties can order (name, nationality, etc.,)
        astronautListViewModel.sortType.value = sortType
    }
}

