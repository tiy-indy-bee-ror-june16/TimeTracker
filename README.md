# TimeTrackr

An Indianapolis IronYard June 2016 Cohort class assignment. A fully operational battlestation for keeping track of developer time in an agency setting. See various modes below for more details on how this app works.

# Deployment

Created using:
* Rails 5

To deploy this app, please visit https://calm-harbor-74411.herokuapp.com/. For the ability to see the full functionality of the app, please contact one of the authors below.

# Contributions

Due to the nature of this app (class project), contributions are ill-advised. But you are more than welcome to fork and clone the repo locally.


# Authors

* [Isaiah Fasoldt](https://github.com/ifasoldt)
* [Daniel Wegrzen](https://github.com/dwegrzen)
* [Sean Ritter](https://github.com/Rittersm)
* [Marie Denney](https://github.com/mldenne)

With help from our instructor...
* [Chris Vannoy](https://github.com/dummied)


# Detailed breakdown of TimeTracker per Mode

### Explorer Mode

* Our time tracking application has two types of users: Admins and Developers
* Unauthenticated users can see only a marketing page at the root. If they try to visit any other page (other than sign up or sign in), they are redirected back to the root with a message.
* Once logged in, Admin users get a dashboard (at the root url) of all their active projects and the total time spent on each project so far (the total of the time each developer has spent). Each project also has a table showing each developer's contribution. Clicking on a developer's name takes them to a page where they can see each time entry for that developer for that project.
* Admins can create projects with at least a name and an expected number of hours.
* Admins can also invite developers to their team and assign them to a project.
* When a developer is invited, they receive an email with a link to create their account.  Their email address should already be filled in and should be associated with the admin that invited them in some way.
* When a developer is logged in (and they should be logged in after finishing sign up as well), they get a dashboard (at the root) that shows each project they've been assigned. Beneath the project name, they have a button to start a timer. Once clicked, a live timer - with seconds precision - begins and they get a button to end the timer. Once they click the end timer button, a time entry is created for that developer and that project. This time entry process should not trigger a page refresh and be done via AJAX. Each project also lists the time entries for that developer on the project - with the date and the timespan for the entry.
* Developers can only create time entries for themselves.
* Developers can view just their own time entries.
* Developers can edit/delete just their own time entries.

## Adventure Mode

* Show the project in red if the total number of hours on the project exceeds the number of hours allowed.
* Modify the admin dashboard to:
  * Show the developer in red if he or she has worked more than 40 hours (across all projects) in the current calendar week.
* If a developer starts a timer and leaves the site/application and comes back, the timer is still running/was running while they were away. In progress timers don't count toward project time until the end timer button is clicked.

##  Epic Mode

* Projects also have clients. Clients are invited by admins and have access to just their projects. They get an email asking them to create their account as well and once logged in, can see only their projects and their time relative to expected (ie. 40 hours out of 60). If the project is within 10% of reaching expected, this text should be yellow. If over, it should be red. Clients cannot see the developers working on the project or individual time entries.
* However, clients can message the admin for the project. Only the client and the admin can view these messages. And admins can reply.
* These messages also trigger emails with the contents of the message and a link to view the message in your app.
