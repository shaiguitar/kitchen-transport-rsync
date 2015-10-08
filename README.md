# Kitchen Transport Rsync 

A 15x time increase or more compared to net:ssh kitchen-test default transport.

# Update

Whops! Looks like this is a dup of an already existing library. Go use his. Oh well opensource.

https://github.com/unibet/kitchen-transport-rsync

# Usage

Use like so.

- Require the gem in your gemfile:

`gem "kitchen-transport-rsync"`

- In the kitchen.yml set the name of the plugin to "rsync":

```yml
transport:
  ssh_key: "foo-jenkins.pem"
  username: 'ssh-user' 
  name: 'rsync'
```

- Run kitchen, see much faster results:

`time bundle exec kitchen converge`

With the regular ssh transport layer:

    bundle exec kitchen converge  5.68s user 1.57s system 2% cpu 5:42.19 total

With this rsync gem:

    bundle exec kitchen converge  2.50s user 0.99s system 15% cpu 22.747 total

So, that's a 15x increase in speed for the _first_ kitchen converge/test.

If you've done this twice (not recreate the instance) the files will have been uploaded, and this should be nearly instant, as rsync will take care of that magic in the background.

# The hax

Ripped out ssh.rb transport from test-kitchen and put in the `rsync`. Using some internal net:ssh internals (key location, etc).

# Alternatives

`kitchen-sync` supports a bunch of other transport layers, worth checking out and comparing the times.

From my limited 1-minute try it seems this library was faster than kitchen-sync but YMMV.
