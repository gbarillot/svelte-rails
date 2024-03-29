# Rails + Svelte + Vite Demo App

## Description

Demo Single Page Application based on Ruby on Rails 7.1.2 + Svelte served with Vite.
Includes all the basic features you need to build a real world app with:

- **Client side routing** including Front / Admin namespaces & locale handling
- **I18n** for both server side and client side
- **Forms** with progress and error handling
- **Authentication** using Devise
- **Pagination** with Kaminari
- **Dynamic search filters** with Ransack, 100% routing and query string friendly
- **Websockets** zero configuration needed, ActionCable out of the box
- **Image upload** with ActiveStorage wired to the API and ready to roll
- **Bootstrap like grid** using CSS Grid layout

All of this is designed with maintainability and readability in mind, slightly inspired by the Rails conventions.

Boostrapping the plumbing for basic stuff can take some time, but once you get the basic it
gets easy to extend and to be really efficient with Svelte + Rails. Starting with this demo you have 
all you need to build up your new project!

## Installation

### Local
```
bundle install
npm install
bundle exec rails db:setup
foreman start
```

**Make sure you have a running Redis on port 6379**

### Docker
```
docker compose up
```

### A note on CSS
As an experiment, CSS is done right in a public/css/development directory.

Pros:
- No compile time: faster workflow
- Enables direct editing and saving from Chrome DevTools (productivity goes 🚀)
- Easier / more fexible to manage imports and variables 

Cons:
- You should disable cache in DevTools in Dev
- Relies on bleeding edge native CSS (nesting...), not suitable for production!

The purpose of this repo is demoing Svelte + Vite + Rails, not CSS, so feel free to use whatever method 
you'd prefer to handle styles. Sprocket is still available in the Rails app, you can use it too.

## Licence

MIT
