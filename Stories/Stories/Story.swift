//
//  Story.swift
//  Stories
//
//  Created by Abdurrahman on 2/24/16.
//  Copyright © 2016 CertifiedWebDevelopers. All rights reserved.
//

import Foundation
import Firebase

class Story {
	
	var text = ""
	var numberOfLikes = 0
	var numberOfAngry = 0
	let thisStoryRef: Firebase?
	
	// Initializer
	init(text: String) {
		self.text = text
		thisStoryRef = storiesRef.childByAutoId()
	}
	
	init(snapshot: FDataSnapshot!) {
		thisStoryRef = snapshot.ref
	
		let snapshotValue = snapshot.value
		text = snapshotValue["text"] as! String
		numberOfLikes = snapshotValue["numberOfLikes"] as! Int
		numberOfAngry = snapshotValue["numberOfAngry"] as! Int
	}
	
	func postThisStory()
	{
		thisStoryRef!.setValue(self.toAnyObject())
	}
	
	func toAnyObject() -> AnyObject {
		return [
			"text" : self.text,
			"numberOfLikes" : self.numberOfLikes,
			"numberOfAngry" : self.numberOfAngry
		]
	}
	
}
