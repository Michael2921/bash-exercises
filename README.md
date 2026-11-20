install_java.sh

The script installs Java and uses conditional statements to check whether it is installed and, if so, which version.

user_processes.sh

The script prompts the user whether they want to filter the process list by memory or CPU and how many lines to print, then sorts the process list based on the chosen option.


node_app.sh

The script installs Node.js and npm, downloads a compressed JavaScript file, and untars it. It then creates a new user and adds them as the owner of the untarred folder and its subfolders.
It switches to the new user, sets environment variables, and runs "npm install" and "node server.js" using them. Finally, it extracts the Node process name and port number from the output of "ps" and "netstat" using awk and prints them to the screen.
