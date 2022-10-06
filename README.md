# README

This is a Web application to manage waste disposal sites using:

- Rails: 7.0.4
- Ruby: 2.7.0
- Bootstrap: 5.1

## Setup

First, you'll need to configure your project with:

```
bundle install
yarn run css:build
```

Then, set the database via:

```
rails db:create
rails db:migrate
```

To start the development server, run:

```
bin/dev
```

## Documentation

This section will introduce the web application's context, with diagrams and tables.

### DER

![Entity relationship diagram](/app/assets/images/der.png)

### Dependencies

| Dependencies | Version |
| ------------ | ------- |
| Yarn         | 1.22.5  |
