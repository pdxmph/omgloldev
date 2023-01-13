# Idea

Make a little Sinatra environment where you can work on your omg.lol blog template, preview changes locally, publish your template and blog posts to omg.lol with minimal shuffling around. 

## See it work

- clone this repo
- cd omgloldev
- `bundle install`
- `ruby omgloldev.rb`
- Visit [http://127.0.0.1:4567/template](http://127.0.0.1:4567/)

## Use it

- Edit files to taste. See below for what some of the files do. 
- Consult the preview as you edit the files. 
- For the love of god make a backup of `/configuration/template.html`
- Visit the raw preview at `/raw` to get a text area with your rendered, weblog.lol-ready template, which you can paste into `/configuration/template.html`. 
- **Danger** Alternately, click save and store the template in the configuration directory, ready to push
- Push the repo. If you've connected all this to the weblog.lol publishing action, it'll squirt your new template up. 


### Views directory

You can edit the following to affect the output:

- `views/template.haml` - This is the template file, in HAML. It's the frame. It pulls in:
  - `views/stylesheet.haml` - Put your CSS in here. 
  - `views/test_post.md` - You can put Markdown in here to simulate a blog post with different elements, styles, etc. 
  - `views/recent.haml` - a quick list of "recents" to simulate a list of recent posts. 

### Logic in `template.haml`

Working with `template.haml` as a haml file lets you both declare what you want in the final, blog.lol-ready output, as well as how you want the preview to work. 

For instance, here's the main body of the template:

```
  %article
    - if @display == "preview" // if you're looking at the preview then ... 
      = markdown :test_post    // pull in the file `views/test_post.md and ...
      = haml :meta             // also pull in the sample meta block via `views/meta.haml`
    - elsif @display == "raw"  // otherwise, if you're looking at the raw view 
      {body}                   // render the weblog.lol {body} tag
      .meta                    // HAML for "<div class='meta'>"
        %i.fa-solid.fa-clock   // HAML for "<i class="fa-solid fa-block">
        {date}                 // render the weblog.lol {date} tag
        %br                    // HAML for "<br />"
        {tags}                 // render the weblog.lol {tags} tag
```




## etc.

- [Useful web tool to quickly convert HTML to HAML](https://awsm-tools.com/html-to-haml)