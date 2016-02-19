//
//  Collection.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation
import SwiftyJSON


public class Collection: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCollectionActorsKey: String = "actors"
	internal let kCollectionGenreKey: String = "genre"
	internal let kCollectionWebsiteUrlKey: String = "website-url"
	internal let kCollectionPublishedDateKey: String = "published-date"
	internal let kCollectionArticleBodyKey: String = "article-body"
	internal let kCollectionDescriptionValueKey: String = "description"
	internal let kCollectionDurationKey: String = "duration"
	internal let kCollectionVideoUrlKey: String = "video-url"
	internal let kCollectionRatingsKey: String = "ratings"
	internal let kCollectionHeadlineKey: String = "headline"
	internal let kCollectionAuthorKey: String = "author"
	internal let kCollectionInternalIdentifierKey: String = "id"
	internal let kCollectionPictureUrlKey: String = "picture-url"
	internal let kCollectionReleaseDateKey: String = "release-date"
	internal let kCollectionDirectorKey: String = "director"
	internal let kCollectionSynopsisKey: String = "synopsis"


    // MARK: Properties
	public var actors: [String]?
	public var genre: [String]?
	public var websiteUrl: String?
	public var publishedDate: String?
	public var articleBody: String?
	public var descriptionValue: String?
	public var duration: String?
	public var videoUrl: String?
	public var ratings: Int?
	public var headline: String?
	public var author: Author?
	public var internalIdentifier: Int?
	public var pictureUrl: String?
	public var releaseDate: String?
	public var director: String?
	public var synopsis: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		actors = []
		if let items = json[kCollectionActorsKey].array {
			for item in items {
				actors?.append(String(item))
			}
		} else {
			actors = nil
		}
		genre = []
		if let items = json[kCollectionGenreKey].array {
			for item in items {
				genre?.append(String(item))
			}
		} else {
			genre = nil
		}
		websiteUrl = json[kCollectionWebsiteUrlKey].string
		publishedDate = json[kCollectionPublishedDateKey].string
		articleBody = json[kCollectionArticleBodyKey].string
		descriptionValue = json[kCollectionDescriptionValueKey].string
		duration = json[kCollectionDurationKey].string
		videoUrl = json[kCollectionVideoUrlKey].string
		ratings = json[kCollectionRatingsKey].int
		headline = json[kCollectionHeadlineKey].string
		author = Author(json: json[kCollectionAuthorKey])
		internalIdentifier = json[kCollectionInternalIdentifierKey].int
		pictureUrl = json[kCollectionPictureUrlKey].string
		releaseDate = json[kCollectionReleaseDateKey].string
		director = json[kCollectionDirectorKey].string
		synopsis = json[kCollectionSynopsisKey].string
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        var dictionary: [String : AnyObject ] = [ : ]
		if actors?.count > 0 {
			var temp: [AnyObject] = []
			for item in actors! {
				temp.append(item)
			}
			dictionary.updateValue(temp, forKey: kCollectionActorsKey)
		}
		if genre?.count > 0 {
			var temp: [AnyObject] = []
			for item in genre! {
				temp.append(item)
			}
			dictionary.updateValue(temp, forKey: kCollectionGenreKey)
		}
		if websiteUrl != nil {
			dictionary.updateValue(websiteUrl!, forKey: kCollectionWebsiteUrlKey)
		}
		if publishedDate != nil {
			dictionary.updateValue(publishedDate!, forKey: kCollectionPublishedDateKey)
		}
		if articleBody != nil {
			dictionary.updateValue(articleBody!, forKey: kCollectionArticleBodyKey)
		}
		if descriptionValue != nil {
			dictionary.updateValue(descriptionValue!, forKey: kCollectionDescriptionValueKey)
		}
		if duration != nil {
			dictionary.updateValue(duration!, forKey: kCollectionDurationKey)
		}
		if videoUrl != nil {
			dictionary.updateValue(videoUrl!, forKey: kCollectionVideoUrlKey)
		}
		if ratings != nil {
			dictionary.updateValue(ratings!, forKey: kCollectionRatingsKey)
		}
		if headline != nil {
			dictionary.updateValue(headline!, forKey: kCollectionHeadlineKey)
		}
		if author != nil {
			dictionary.updateValue(author!.dictionaryRepresentation(), forKey: kCollectionAuthorKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kCollectionInternalIdentifierKey)
		}
		if pictureUrl != nil {
			dictionary.updateValue(pictureUrl!, forKey: kCollectionPictureUrlKey)
		}
		if releaseDate != nil {
			dictionary.updateValue(releaseDate!, forKey: kCollectionReleaseDateKey)
		}
		if director != nil {
			dictionary.updateValue(director!, forKey: kCollectionDirectorKey)
		}
		if synopsis != nil {
			dictionary.updateValue(synopsis!, forKey: kCollectionSynopsisKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.actors = aDecoder.decodeObjectForKey(kCollectionActorsKey) as? [String]
		self.genre = aDecoder.decodeObjectForKey(kCollectionGenreKey) as? [String]
		self.websiteUrl = aDecoder.decodeObjectForKey(kCollectionWebsiteUrlKey) as? String
		self.publishedDate = aDecoder.decodeObjectForKey(kCollectionPublishedDateKey) as? String
		self.articleBody = aDecoder.decodeObjectForKey(kCollectionArticleBodyKey) as? String
		self.descriptionValue = aDecoder.decodeObjectForKey(kCollectionDescriptionValueKey) as? String
		self.duration = aDecoder.decodeObjectForKey(kCollectionDurationKey) as? String
		self.videoUrl = aDecoder.decodeObjectForKey(kCollectionVideoUrlKey) as? String
		self.ratings = aDecoder.decodeObjectForKey(kCollectionRatingsKey) as? Int
		self.headline = aDecoder.decodeObjectForKey(kCollectionHeadlineKey) as? String
		self.author = aDecoder.decodeObjectForKey(kCollectionAuthorKey) as? Author
		self.internalIdentifier = aDecoder.decodeObjectForKey(kCollectionInternalIdentifierKey) as? Int
		self.pictureUrl = aDecoder.decodeObjectForKey(kCollectionPictureUrlKey) as? String
		self.releaseDate = aDecoder.decodeObjectForKey(kCollectionReleaseDateKey) as? String
		self.director = aDecoder.decodeObjectForKey(kCollectionDirectorKey) as? String
		self.synopsis = aDecoder.decodeObjectForKey(kCollectionSynopsisKey) as? String
    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(actors, forKey: kCollectionActorsKey)
		aCoder.encodeObject(genre, forKey: kCollectionGenreKey)
		aCoder.encodeObject(websiteUrl, forKey: kCollectionWebsiteUrlKey)
		aCoder.encodeObject(publishedDate, forKey: kCollectionPublishedDateKey)
		aCoder.encodeObject(articleBody, forKey: kCollectionArticleBodyKey)
		aCoder.encodeObject(descriptionValue, forKey: kCollectionDescriptionValueKey)
		aCoder.encodeObject(duration, forKey: kCollectionDurationKey)
		aCoder.encodeObject(videoUrl, forKey: kCollectionVideoUrlKey)
		aCoder.encodeObject(ratings, forKey: kCollectionRatingsKey)
		aCoder.encodeObject(headline, forKey: kCollectionHeadlineKey)
		aCoder.encodeObject(author, forKey: kCollectionAuthorKey)
		aCoder.encodeObject(internalIdentifier, forKey: kCollectionInternalIdentifierKey)
		aCoder.encodeObject(pictureUrl, forKey: kCollectionPictureUrlKey)
		aCoder.encodeObject(releaseDate, forKey: kCollectionReleaseDateKey)
		aCoder.encodeObject(director, forKey: kCollectionDirectorKey)
		aCoder.encodeObject(synopsis, forKey: kCollectionSynopsisKey)
    }

}
