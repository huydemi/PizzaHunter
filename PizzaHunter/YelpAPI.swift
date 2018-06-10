import Siesta

class YelpAPI {
  static let sharedInstance = YelpAPI()
  
  // Each API service is represented by a Service class in Siesta
  private let service = Service(baseURL: "https://api.yelp.com/v3", standardTransformers: [.text, .image])
  
  private init() {
    
    // Tell Siesta about the details you want it to log to the console
    LogCategory.enabled = [.network, .pipeline, .observers]
    
    service.configure("**") {
      
      // Yelp’s API requires clients to send their access token in every HTTP request header for authorization
      $0.headers["Authorization"] =
      "Bearer B6sOjKGis75zALWPa7d2dNiNzIefNbLGGoF75oANINOL80AUhB1DjzmaNzbpzF-b55X-nG2RUgSylwcr_UYZdAQNvimDsFqkkhmvzk6P8Qj0yXOQXmMWgTD_G7ksWnYx"
      
      // Set the expirationTime to 1 hour
      $0.expirationTime = 60 * 60 // 60s * 60m = 1 hour
    }
    
    let jsonDecoder = JSONDecoder()
    
    service.configureTransformer("/businesses/*") {
      try jsonDecoder.decode(RestaurantDetails.self, from: $0.content)
    }
    
    service.configureTransformer("/businesses/search") {
      try jsonDecoder.decode(SearchResults<Restaurant>.self, from: $0.content).businesses
    }
  }
  
  func restaurantList(for location: String) -> Resource {
    return service
      .resource("/businesses/search")
      .withParam("term", "pizza")
      .withParam("location", location)
  }
  
  func restaurantDetails(_ id: String) -> Resource {
    return service
      .resource("/businesses")
      .child(id)
  }
}
