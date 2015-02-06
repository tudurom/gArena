# gArena 
## A simple, ruby-based LMS
[![security](https://hakiri.io/github/tudurom/gArena/master.svg)](https://hakiri.io/github/tudurom/gArena/master)
[![Code Climate](https://codeclimate.com/github/tudurom/gArena/badges/gpa.svg)](https://codeclimate.com/github/tudurom/gArena)

gArena is a very simple, ruby-on-rails based LMS.
### Current features:
- A mini blog for posting announces.
- User management console (changing roles other than admin is coming)
- Course made of lessons. Courses can be public, which can be viewed by anyone, or private, where you need to select students for them.
- Responsive design

### Dependencies
You need ruby 2.1, node.js, ruby-dev tools and mysql.

### Installation instructions
*Warning: Untested instructions*

First, clone the repo. Then, config your DB.

Run:

    bundle install
then

    rake db:setup

Next, create your user. Coming back with an installation script!

### To-Do list
1. Ability to change other roles than admin
2. A 3D globe for Geography
3. Design improvements
