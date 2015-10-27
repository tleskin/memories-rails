# Memories API

Memories API is a Rails app used for technical interviews at Parent Co. &
Notabli. Work done on this codebase will not be used or released. This is
specifically for understanding how one approaches development and their skill
level.

##  Assignment

Branch off of master, and work on implementing the tasks as you normally would.
Open up a pull request early, and commit often, explaining your approach and
thought process.

### Tasks

1. Add support for adding new Moments.
1. Add support for viewing a Memory (a Moment from the past), based on the logic
   laid out above for surfacing a Memory.

### The Gist

There is one model, the `Moment`. It is a basic representation of what gets
stored in Notabli. A moment has a `happened_at` datetime stamp that signifies
when the moment took place. A moment also has a `caption`, `content`, and
`location`.

There is also the concept of a Memory, which is just a Moment, but it is
surfaced based on one of the following conditions:

- Happened on the same date at any year in the past
- Happened at the same location as the most recent moment
- A random moment

To explain in more detail, if there are no moments that occurred on the same
date in the past, then return a moment that happened at the same location as the
most recent moment. If there are no moments at the same location as the most
recent moment, return a random moment.

### Expectations

Write tests where it seems applicable. Do not worry about smaller details. Focus
on the bigger picture implementation.

Branch off of master and commit as you go.

## Developing

The local development environment is managed by Vagrant.

### Getting Started

1. Clone the repository.
1. Change into the directory.
1. [Download and install Vagrant](https://www.vagrantup.com/downloads.html)
1. [Download and install VirtualBox](https://www.virtualbox.org/)
1. Start-up the VM and provision it: `vagrant up` (will require your password)

Note: If vagrant up does not finish completely (green) there are a couple things to try. First verify that your Vagrant and versions are up to date. Second, if the build failed on gem install, use vagrant ssh and troubleshoot it on the box.

### Post-provision Setup

1. SSH into VM: `vagrant ssh`
1. Install dependencies: `bundle install`
1. Create the database: `rake db:setup`
1. Run migrations: `rake db:migrate`
1. Boot up the Rails server: `rails server -b 0.0.0.0`

The app will now be accessible at http://localhost:3000.
