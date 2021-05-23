







import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let word = [("Dpi"), ("IDE"), ("Mock up"), ("MS"), ("Bug"), ("ISP"), ("SDK"), ("GUI"), ("Debug"), ("Database")]
    
    var filteredArr: [String] = []
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.setupTableView()
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Write a word..."
        searchController.searchBar.scopeButtonTitles = [ "All", "Designer", "Developer", "Etc" ]
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredArr.count : self.word.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if self.isFiltering {
            cell.textLabel?.text = self.filteredArr[indexPath.row]
        } else {
            cell.textLabel?.text = self.word[indexPath.row]
        }
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        self.filteredArr = self.word.filter { $0.localizedCaseInsensitiveContains(text) }
        
        self.tableView.reloadData()
    }
}

