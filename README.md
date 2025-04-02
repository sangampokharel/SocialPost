SocialPost

A simple iOS social media application built using Uikit and VIPER architecture, demonstrating user-generated posts with a minimalistic UI. This project allows users to create and view posts within a local environment.

Features

Three dummy users with a dropdown to switch between them.

Scrollable list of posts displaying user details, text, and optional images.

"Create Post" button to add new posts with text and images.

Local storage for posts (no backend integration).

Project Structure

Models

User: Represents an app user with name, username, and profile image.

Post: Represents a post with user details, text, optional image, and timestamp.

Views

PostListView: Displays the list of posts.

CreatePostView: Allows users to create a new post.

UserSelectionView: Dropdown menu for selecting users.

ViewModel

PostViewModel: Manages posts and updates the UI.

Installation

Clone the repository:

git clone https://github.com/sangampokharel/SocialPost

Open the project in Xcode.

Run the app on a simulator.

Requirements

iOS 16+

Xcode 16+

Swift 5.9+

How It Works

Select a user from the dropdown menu.

View posts submitted by all users in a scrollable list.

Tap "Create Post" to enter text and optionally select an image.

Submit the post, and it appears in the feed instantly.


Author

Developed by Sangam, an iOS developer 

License

This project is licensed under the MIT License.
