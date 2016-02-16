//
//  Author.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation
import SwiftyJSON


public class Author: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kAuthorNameKey: String = "name"
	internal let kAuthorTwitterKey: String = "twitter"
	internal let kAuthorHeadshotKey: String = "headshot"


    // MARK: Properties
	public var name: String?
	public var twitter: String?
	public var headshot: String?


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
		name = json[kAuthorNameKey].string
		twitter = json[kAuthorTwitterKey].string
		headshot = json[kAuthorHeadshotKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if name != nil {
			dictionary.updateValue(name!, forKey: kAuthorNameKey)
		}
		if twitter != nil {
			dictionary.updateValue(twitter!, forKey: kAuthorTwitterKey)
		}
		if headshot != nil {
			dictionary.updateValue(headshot!, forKey: kAuthorHeadshotKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.name = aDecoder.decodeObjectForKey(kAuthorNameKey) as? String
		self.twitter = aDecoder.decodeObjectForKey(kAuthorTwitterKey) as? String
		self.headshot = aDecoder.decodeObjectForKey(kAuthorHeadshotKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(name, forKey: kAuthorNameKey)
		aCoder.encodeObject(twitter, forKey: kAuthorTwitterKey)
		aCoder.encodeObject(headshot, forKey: kAuthorHeadshotKey)

    }

}
