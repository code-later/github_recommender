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
