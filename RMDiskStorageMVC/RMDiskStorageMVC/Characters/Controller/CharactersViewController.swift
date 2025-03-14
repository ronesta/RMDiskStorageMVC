//
//  ViewController.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 29.12.2024.
//

import UIKit
import SnapKit

final class CharactersViewController: UIViewController {
    lazy var characterView: CharactersView = {
        let view = CharactersView(frame: .zero)
        view.tableView.dataSource = characterTableViewDataSource
        return view
    }()

    private let characterTableViewDataSource: CharactersTableViewDataSource
    private let charactersService: CharactersService
    private let storageManager: DiskStorageManager

    init(characterTableViewDataSource: CharactersTableViewDataSource,
         charactersService: CharactersService,
         storageManager: DiskStorageManager
    ) {
        self.characterTableViewDataSource = characterTableViewDataSource
        self.charactersService = charactersService
        self.storageManager = storageManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = characterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getCharacters()
    }

    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
    }

    private func getCharacters() {
        if let savedCharacters = storageManager.loadCharacters() {
            characterTableViewDataSource.characters = savedCharacters
            characterView.tableView.reloadData()
            return
        }

        charactersService.getCharacters { [weak self] result in
            switch result {
            case .success(let character):
                self?.characterTableViewDataSource.characters = character
                self?.characterView.tableView.reloadData()
                self?.storageManager.saveCharacters(character)
            case .failure(let error):
                print("Failed to fetch drinks: \(error.localizedDescription)")
            }
        }
    }
}
