//
//  TelegraphData.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation
import SwiftyJSON


public class TelegraphData: NSObject, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTelegraphDataCollectionKey: String = "collection"
    
    
    // MARK: Properties
	public var collection: [Collection]?
    
    
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
		collection = []
		if let items = json[kTelegraphDataCollectionKey].array {
			for item in items {
				collection?.append(Collection(json: item))
			}
		} else {
			collection = nil
		}

    }
    
    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if collection?.count > 0 {
			var temp: [AnyObject] = []
			for item in collection! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTelegraphDataCollectionKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.collection = aDecoder.decodeObjectForKey(kTelegraphDataCollectionKey) as? [Collection]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(collection, forKey: kTelegraphDataCollectionKey)

    }

}
