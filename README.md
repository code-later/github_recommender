# Github Recommender

This is a small Rails app to showcase the [Guacamole gem](http://guacamolegem.org) for the multi-model database [ArangoDB](https://www.arangodb.com).

Since ArangoDB has very good graph features and Guacamole uses a graph to implement relations between documents this app has its focus on this.

The app does the following:

* Fetches your Github user and all of your followings
* Fetch your repositories and all of your followings
* Recommend repositories based on your followings

## Running the app

Before you start you need to [install ArangoDB](https://www.arangodb.com/install) additionally you need Redis for the background jobs.

After your cloned the repo, run a bunle install

```shell
bundle install
```

Now you need to create the development database in ArangoDB

```shell
bundle exec rake db:create
```

In order to communicate with GitHub you need to create an OAuth application and add the key and secret to `.env`

```shell
export GITHUB_KEY=your-key
export GITHUB_SECRET=your-secret
```

After that start the server and worker and point your browser to <http://localhost:3001>

```shell
bundle exec invoker start Procfile --port 3000 
```

## Deployment

Deployment is done via Docker and [Giant Swarm](http://giantswarm.io/). Giant Swarm is currently in Alpha if you ask nicely you will get access ;-)

Besides the swarm CLI app you need [docker installed](http://docs.docker.com/installation). To build the docker images run `rake docker:build`.

To deploy to Giant Swarm you need a `swarmvars.json` next the the `swarm.json` with sensible env variables:

```json
{
    "GIANT_SWARM_USER/dev": {
        "github_key": "GITHUB_KEY",
        "github_secret": "GITHUB_SECRET",
        "secret_key_base": "SECRET_KEY_BASE"
    }
}
```
