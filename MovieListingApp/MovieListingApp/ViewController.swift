//
//  ViewController.swift
//  MovieListingApp
//
//  Created by Akanksha on 25/06/21.
//

import UIKit

class ViewController : UIViewController {
    
        
    @IBOutlet weak var movieTableView: UITableView!
    var movieDetails: movieData?
    let baseURL: String = "https://image.tmdb.org/t/p/w92"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "customTableViewCell", bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: "customTableViewCell")
        view.backgroundColor = .systemTeal

        let jsonData = readJsonFile(forName: "movies")
        if let data = jsonData
        {
            if let movieObject = parse(jsonData: data)
            {
                movieDetails = movieObject
                movieTableView.reloadData()
            }
        }
        movieTableView.delegate = self
        movieTableView.dataSource = self
   }
}

//MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "showMovieDetailsController", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? MovieDetailsViewController{
            details.movieDetail = movieDetails?.movies[(movieTableView.indexPathForSelectedRow?.row)!]
            
        }
    }
}
//MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetails?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? customTableViewCell
        cell?.movieTitle.text = movieDetails?.movies[indexPath.row].title
        cell?.movieOverview.text = movieDetails?.movies[indexPath.row].overview
        
        let posterURL = movieDetails?.movies[indexPath.row].poster_path ?? ""
        
        if let imageURl = URL(string: (baseURL + posterURL))
        {
            let task = URLSession.shared.dataTask(with: imageURl) {(data, response, error) in
                guard let data = data else {
                    return
                }
                let poster = UIImage(data: data)
                
                DispatchQueue.main.async {
                    cell?.moviePoster.image = poster
                }
            }
            task.resume()
        }
        return cell!
    }
}




