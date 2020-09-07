# Lifestyle-Blog
- Ruby v2.7.1
- Ruby on Rails

# Set-Up instructions
* Setup Ruby and Ruby-on-Rails on your computer
* Clone this repository by running `https://github.com/SmithVyne/Lifestyle-Blog.git` and cd into the directory
* Run `bundle install` to install the necessary ruby gems
* Run `rails server` to start-up the application and visit `localhost:3000` in your browser to access it.


I created a lifestyle blog where users can:

1. Create an account
2. Write articles with image headers
3. Vote on different articles. Both of the same user or a different user.
4. Add articles to different categories
5. Create new categories


- I created a has_many belongs_to relationship between users and articles
- I also created relationships between articles and their categories
- To create votes, I created a join relationship. So votes belong to users and articles.
- I set up the layout of the app, using the given design.
- I laid out the basic MVP. Focusing on getting the app to work first.


## Live Demo

[Link to Demo](https://fast-wave-49614.herokuapp.com/)

## Authors

👤 **Smith Nkereuwem**

- Github: [@SmithVyne](https://github.com/SmithVyne)
- Twitter: [@SmithVyne](https://twitter.com/SmithVyne)
- Email: [email me](mailto:smithnkereuwem2@gmail.com)

## Show your support

Give a ⭐️ if you like this project!
