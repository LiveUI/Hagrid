//
//  ViewController.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import UIKit
import TheGrid
import Modular


class ViewController: UIViewController {
    
    let gridView = GridView()
    
    // MARK: Example app
    
    let albumCover = UIImageView()
    
    let albumTitleLabel = UILabel()
    let artistLabel = UILabel()
    let yearLabel = UILabel()
    
    /// Create album cover
    func configureAlbumCover() {
        albumCover.backgroundColor = .random
        albumCover.image = UIImage(named: "TestData/AlbumCover")
        albumCover.contentMode = .scaleAspectFill
        albumCover.clipsToBounds = true
        gridView.addSubview(albumCover, pos: 0, columns: 5, padding: .left(6)) { make in
            make.height.equalTo(self.albumCover.snp.width)
        }
    }
    
    /// Create album labels
    func createAlbumLabels() {
        albumTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        albumTitleLabel.text = "Ten"
        albumTitleLabel.textColor = .darkText
        gridView.addSubview(albumTitleLabel, pos: 5, columns: 3, padding: .left(12))
    }
    
    /// Add all subviews on the canvas
    func addSubviews() {
        configureAlbumCover()
        createAlbumLabels()
    }
    
    // MARK: Other interface
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupGridView()
        
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
    }
    
    func setupNavBar() {
        title = "Hagrid"
        
        let columns = UISegmentedControl(items: ["12", "8", "22"])
        columns.addTarget(self, action: #selector(selectColumns(_:)), for: .valueChanged)
        columns.selectedSegmentIndex = 0
        let columnsItem = UIBarButtonItem(customView: columns)
        navigationItem.leftBarButtonItem = columnsItem
        
        let toggleGrid = UIBarButtonItem(title: "Grid", style: .plain, target: self, action: #selector(toggleGrid(_:)))
        navigationItem.rightBarButtonItem = toggleGrid
    }
    
    func setupGridView() {
        gridView.place.on(andFill: view, top: 6, left:20, right: -20)
        gridView.config.displayGrid = true
        
        addSubviews()
    }
    
    // MARK: Actions
    
    @objc func selectColumns(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .beginFromCurrentState, animations: {
            if sender.selectedSegmentIndex == 0 {
                self.gridView.config.numberOfColumns = 12
            } else if sender.selectedSegmentIndex == 1 {
                self.gridView.config.numberOfColumns = 8
            } else {
                self.gridView.config.numberOfColumns = 22
            }
        })
    }
    
    @objc func toggleGrid(_ sender: UIBarButtonItem) {
        gridView.config.displayGrid = !gridView.config.displayGrid
    }

}
