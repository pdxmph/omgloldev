# Development Notes

We want to be able to do a few things:

- See a preview of our design work
  - live reload options?
- Get a text view of our template we can output to the right template file
- Put things in the right places so that the repo containing this project can serve as the source repo for the service. 
- Click a button to save the template to the right place. 
- Click a button to publish? 


We need to be able to:

- Replace omg.lol templating placeholders with content 
  - YAML fixtures
  - make a HAML template with conditional logic? 

## omg.lol template tags to account for

- {weblog-title}
- {separator}
- {post-title}
- {body}
- {date}
- {tags}
- {recent-posts}
- ??? 

## Stretch goals

- Leverage the omg.lol blogging API and build a previewing/publishing tool 
- Automate the git publishing part