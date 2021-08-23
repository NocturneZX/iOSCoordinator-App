## Instructions

This repository contains the outline and some pre-made components for a simple app, including:
* A mock network service which retrieves a JSON blob from a file, with a baked-in three second delay;
* A simple coordinator/state machine outline;
* A simple `UIView`/`UIViewController`, which already have the following components:
    * A `UIActivityIndicatorView` to show that data is loading from the network
    * A `UITableView` to show the data retrieved from the network
    * A `UILabel` to show an error if data retrieval fails

Your task is to:
- Call the network service when the app finishes launching, and show the loading indicator while the call is pending
- Display some contents of each JSON object in the `UITableView` if the call is successful
- If the network call fails, show an error to the user.

Hints:
- At minimum, you'll need to fill in the `TODO`s included in the template, although you'll need to add additional code as well
- The app's UI should be a strict reflection of state
- Don't worry about visual aesthetics, as there won't be time to cover that during the interview

## For Interviewers

[Grading criteria](https://aspirationpartners.atlassian.net/wiki/spaces/EN/pages/1442218860/iOS+Interviews+-+Networking+App)
