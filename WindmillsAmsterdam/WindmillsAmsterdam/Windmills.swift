/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Windmills {
	public var oBJECTNUMMER : Int?
	public var eigenaar : String?
	public var windpark : String?
	public var vermogen_kW : Int?
	public var productie_MWh : Int?
	public var rotordiameter : Int?
	public var ashoogte : Int?
	public var bouwjaar : Int?
	public var cOORDS : String?
	public var lNG : String?
	public var lAT : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let Windmills_list = Windmills.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Windmills Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Windmills]
    {
        var models:[Windmills] = []
        for item in array
        {
            models.append(Windmills(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let Windmills = Windmills(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Windmills Instance.
*/
	required public init?(dictionary: NSDictionary) {

		oBJECTNUMMER = dictionary["OBJECTNUMMER"] as? Int
		eigenaar = dictionary["Eigenaar"] as? String
		windpark = dictionary["Windpark"] as? String
		vermogen_kW = dictionary["Vermogen_kW"] as? Int
		productie_MWh = dictionary["Productie_MWh"] as? Int
		rotordiameter = dictionary["Rotordiameter"] as? Int
		ashoogte = dictionary["Ashoogte"] as? Int
		bouwjaar = dictionary["Bouwjaar"] as? Int
		cOORDS = dictionary["COORDS"] as? String
		lNG = dictionary["LNG"] as? String
		lAT = dictionary["LAT"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.oBJECTNUMMER, forKey: "OBJECTNUMMER")
		dictionary.setValue(self.eigenaar, forKey: "Eigenaar")
		dictionary.setValue(self.windpark, forKey: "Windpark")
		dictionary.setValue(self.vermogen_kW, forKey: "Vermogen_kW")
		dictionary.setValue(self.productie_MWh, forKey: "Productie_MWh")
		dictionary.setValue(self.rotordiameter, forKey: "Rotordiameter")
		dictionary.setValue(self.ashoogte, forKey: "Ashoogte")
		dictionary.setValue(self.bouwjaar, forKey: "Bouwjaar")
		dictionary.setValue(self.cOORDS, forKey: "COORDS")
		dictionary.setValue(self.lNG, forKey: "LNG")
		dictionary.setValue(self.lAT, forKey: "LAT")

		return dictionary
	}

}
