//
//  AstronautDetailViewController.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import UIKit

final class AstronautDetailViewController : UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    private var refreshControl: UIRefreshControl!
    var astronautDetailViewModel : AstronautDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
        setupUI()
        
        // notify viewModel changes to UI via binding
        astronautDetailViewModel.astronaut.bind { [weak self] astronautViewModel in
            DispatchQueue.main.async {
                self?.updateUI(astronautViewModel)
            }
        }
        
        astronautDetailViewModel.fetchData()
    }
}

// MARK: UI setup
private extension AstronautDetailViewController {
    
    @objc func refresh(_ sender: AnyObject) {
        astronautDetailViewModel.fetchData()
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }
    
    func setupUI() {
        thumbnailImageView.setCornerRadius(Constants.viewCornerRadius)
    }
    
    func updateUI(_ model: AstronautViewModel?) {
        nameLabel.text = model?.name
        nationalityLabel.text = model?.nationality
        bioLabel.text = model?.bio
        dobLabel.text = String.localizedStringWithFormat("date_of_birth".localized, model?.dateOfBirth ?? "")
        thumbnailImageView.imageFromUrl(urlString: model?.profileImageThumbnail, placeHolderImage: nil)
    }
}

// MARK: Update Data Loading states
extension AstronautDetailViewController: LoadingDelegate {
    
    func updateLoading(state: LoadingState) {
        switch state {
        case .loading:
            refreshControl.beginRefreshing()
            contentView.isHidden = true
        case .failure(let error):
            showAlert(title: "error".localized, message: error?.localizedDescription)
            refreshControl.endRefreshing()
        case .success:
            refreshControl.endRefreshing()
            contentView.isHidden = false
        }
    }
}

