//
//  MovieData.swift
//  Zup
//
//  Created by Victor de Paula on 04/11/17.
//  Copyright © 2017 Victor de Paula. All rights reserved.
//

import Foundation


class MovieData: AbstractData {
    
    static let sharedInstance: MovieData = {
        let instance = MovieData(entityName: Entidades.movies.rawValue)
        return instance
    }()
    
    init(entityName: String) {
        super.init()
        self.entityName = entityName
    }
    
    func saveCountry(_ data: Movie) -> Any? {
        var dictionary: [String: Any] = [:]
        //        dictionary["user_id"] = userID
        dictionary["id"] = data.id
        dictionary["actors"] = data.actors
        dictionary["awards"] = data.awards
        dictionary["country"] = data.country
        dictionary["director"] = data.director
        dictionary["genre"] = data.genre
        dictionary["language"] = data.language
        dictionary["plot"] = data.plot
        dictionary["rated"] = data.rated
        dictionary["released"] = data.released
        dictionary["runtime"] = data.runtime
        dictionary["title"] = data.title
        dictionary["writer"] = data.writer
        dictionary["year"] = data.year
        dictionary["poster"] = data.moviedata
        let result = self.save(dictionary)
        return result ?? ""
    }
    
    
    func getAllMovies() -> [Movie]? {
        var moviesArray = [Movie]()
        let result = get()
        let fetchCountry = result as! [Movies]
        
        for index in 0..<fetchCountry.count {
            let movie = Movie()
            movie.id = fetchCountry[index].id
            movie.actors = fetchCountry[index].actors
            movie.awards = fetchCountry[index].awards
            movie.country = fetchCountry[index].country
            movie.director = fetchCountry[index].director
            movie.genre = fetchCountry[index].genre
            movie.language = fetchCountry[index].language
            movie.plot = fetchCountry[index].plot
            movie.rated = fetchCountry[index].rated
            movie.runtime = fetchCountry[index].runtime
            movie.title = fetchCountry[index].title
            movie.writer = fetchCountry[index].writer
            movie.year = fetchCountry[index].year
            movie.moviedata = fetchCountry[index].poster
            
            moviesArray.append(movie)
        }
        return moviesArray
    }
    
    
    func getCountriesWith(userId: String) -> [Movie]? {
        var moviesArray = [Movie]()
        let result = getWithUserId(userId, atributte: .profile)
        let fetchCountry = result as! [Movies]
        for index in 0..<fetchCountry.count {
            let movie = Movie()
            movie.id = fetchCountry[index].id
            movie.actors = fetchCountry[index].actors
            movie.awards = fetchCountry[index].awards
            movie.country = fetchCountry[index].country
            movie.director = fetchCountry[index].director
            movie.genre = fetchCountry[index].genre
            movie.language = fetchCountry[index].language
            movie.plot = fetchCountry[index].plot
            movie.rated = fetchCountry[index].rated
            movie.runtime = fetchCountry[index].runtime
            movie.title = fetchCountry[index].title
            movie.writer = fetchCountry[index].writer
            movie.year = fetchCountry[index].year
            moviesArray.append(movie)
        }
        
        return moviesArray
    }
    
    //    func verifyCountryExistWith(userID: String, countryID: Int32) -> Country? {
    //        let result = getWithUserIdAndCountryId(value: userID, countryID: countryID, attribute: .country)
    //        let fetchCountry = result as? [Countries]
    //
    //        if fetchCountry?.count != 0 {
    //            if let CountryResult = fetchCountry?[0] {
    //                print("\(CountryResult.shortname!) is Encountered in Database !")
    ////                let country = Country()
    ////                country.id = CountryResult.id
    ////                country.shortname = CountryResult.shortname
    ////                country.longname = CountryResult.longname
    ////                country.iso = CountryResult.iso
    ////                country.callingCode = CountryResult.callingcode
    ////                country.culture = CountryResult.culture
    ////                country.isvisited = CountryResult.isvisited
    ////                country.checkin = CountryResult.checkin
    //                return country
    //            }
    //        }
    //
    //        return nil
    //    }
    
    //    func updateCountryWith(currentUserUD: String?, country: Country){
    //        let isUpdated = updateCountryWithUserID(value: currentUserUD, country: country, attribute: .country)
    //        if isUpdated {
    //            print("Country \(country.shortname) is Updated Successfully !")
    //        }
    //    }
    //
        func removeMovie(currentUserID: String?) -> Bool? {
            let isSuccess = removeMovieWithId(value: currentUserID, attribute: .profile)
            return isSuccess
        }
    
    
}

