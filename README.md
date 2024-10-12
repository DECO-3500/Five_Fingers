# Welcome to Five_Fingers!
A travle website based on Vue.js and Express, including features like comments, navigation, homepage, and lazy loading.


# Background
None


# Install
<p align="left">
</p>

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a> <a href="https://nodejs.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nodejs/nodejs-original-wordmark.svg" alt="nodejs" width="40" height="40"/> </a> <a href="https://vuejs.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/vuejs/vuejs-original-wordmark.svg" alt="vuejs" width="40" height="40"/> </a> </p>

 Download the [Node.js](https://nodejs.org/en/download/prebuilt-installer)

 Download the [mysql](https://dev.mysql.com/downloads/installer/)

# Main Function

### 1. Welcome page

This is the welcome page users see when they enter the app, providing a brief introduction to the core features of the app, encouraging them to log in or register. Clicking on this will take the user to section 2 (Login Page).

### 2. Login/Registration Page
- **Login Page**:

	-Users can input their username and password here to log in to the app.

	- Provides a "Forgot Password" option to help users reset their password.

	- Supports quick login through social media platforms (e.g., Google, Facebook, WeChat).

- **Registration Page**:

	- New users can create an account here by entering a username, password, and email, or by registering via social media.

	- Can include a terms page that outlines privacy policies.

### 3. Main Menu Page

- The main page users see after logging in, providing quick links to core features.

- Includes navigation buttons for accessing the community, travel companion matching, personal profile, AR features, and Local Favourites.

### 4. Community Page

- Users can browse posts from other travelers and share their own travel experiences.

	- Posts are displayed in a grid layout; users can like, comment on posts, and filter content based on tags such as "Following," "Nearby," and "Explore."

	- Users can post their own travel content, sharing pictures and text.

		- Requires a posting interface where users can upload local images and text.

		- Users should be able to open others' posts to comment and like them.

### 5. Travel Companion Matching Page

- Displays potential travel companions, providing information on user profiles, distance, and similar interests.
  
	- Users can click to view detailed profiles or click the "Match" button to connect with the companion.

	- **Flight Chatroom**: Offers the ability to filter flights by date and join chat rooms to chat with fellow travelers.

### 6. Profile Page
- Users can view and update their personal information, including avatar, name, gender, destination, travel dates, and bio.

	-Users can save their updated information to keep their profile up to date.

### 7. AR (Augmented Reality) Page

- Users can use their phone's camera to scan landmarks or objects; the app will recognize the landmark and display related text information or play an audio introduction.

	- The page shows the camera's viewfinder, and users can scan to get real-time landmark information.

### 8. Local Favourites

- Displays recently viewed local shops, and users can leave comments.

	- This feature is complete, but currently, comments cannot be posted. It is recommended to add a navigation function using Google Maps API.

### 9. Settings Page

- Users can manage account settings and app preferences, such as notification settings, language preferences, and account privacy options.

### 10. Location Details Page

- After clicking on a community or recommended destination, users will be redirected to this page, which displays detailed information about the landmark or attraction.

	- Includes image displays, text descriptions, historical background, user ratings, and comment functionality.

### 11. Messages Page

- Displays the user's chat history with travel companions or community members, allowing users to view and reply to messages.

	- Private chat interface.

	- Group chat interface (for community chats).

# Usage
Modify the MySQL database file: Change the username and password to your own, usually root and 123456.

In the express-client directory, run the command in the cmd: node app.js.

In the my-project directory, run the command in the cmd: npm run serve.




# Related Efforts

Synchronization is one of the biggest features of StackEdit. It enables you to synchronize any file in your workspace with other files stored in your **Google Drive**, your **Dropbox** and your **GitHub** accounts. This allows you to keep writing on other devices, collaborate with people you share the file with, integrate easily into your workflow... The synchronization mechanism takes place every minute in the background, downloading, merging, and uploading file modifications.

There are two types of synchronization and they can complement each other:

- The workspace synchronization will sync all your files, folders and settings automatically. This will allow you to fetch your workspace on any other device.
	> To start syncing your workspace, just sign in with Google in the menu.

- The file synchronization will keep one file of the workspace synced with one or multiple files in **Google Drive**, **Dropbox** or **GitHub**.
	> Before starting to sync files, you must link an account in the **Synchronize** sub-menu.

 # Contributer

Thanks goes to these wonderful people!

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/navvy36">
        <img src="https://github.com/navvy36.png" width="80" height="80" alt="navvy36"/>
      </a><br/>
      <sub><b>navvy36</b></sub><br/>
    </td>
    <td align="center">
      <a href="https://github.com/MPK195">
        <img src="https://github.com/MPK195.png" width="80" height="80" alt="MPK195"/>
      </a><br/>
      <sub><b>MPK195</b></sub><br/>
    </td>
    <td align="center">
      <a href="https://github.com/Pr297">
        <img src="https://github.com/Pr297.png" width="80" height="80" alt="Pr297"/>
      </a><br/>
      <sub><b>Pr297</b></sub><br/>
    </td>
    <td align="center">
      <a href="https://github.com/Christeena06">
        <img src="https://github.com/Christeena06.png" width="80" height="80" alt="Christeena06"/>
      </a><br/>
      <sub><b>Christeena06</b></sub><br/>
    </td>
    <td align="center">
      <a href="https://github.com/JING0823">
        <img src="https://github.com/JING0823.png" width="80" height="80" alt="JING0823"/>
      </a><br/>
      <sub><b>JING0823</b></sub><br/>
    </td>
  </tr>
</table>
