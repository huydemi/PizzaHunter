# pizzahunter

Fetching data over the network is one of the most common tasks in mobile apps.
You must write and manage a lot repetitive code such as:

- Managing duplicate requests.
- Canceling requests that are no longer needed, such as when user exits a screen.
- Fetching and processing data on background thread, and updating the UI on the main thread.
- Parsing responses and converting them into model objects.
- Showing and hiding loading indicators.
- Displaying data when it arrives.


[Siesta](https://github.com/bustoutsolutions/siesta) is a networking library that automates this work and reduces the complexity of your code involved in fetching and displaying data from the network.

In this tutorial, you’ll build Pizza Hunter, an app that lets users search for pizza restaurants around them

![walkthrough](https://koenig-media.raywenderlich.com/uploads/2018/03/ChooseCity.gif)

---

Source:

- [How to make a RESTful app with Siesta](https://www.raywenderlich.com/182219/make-restful-app-siesta)