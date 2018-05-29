# Family Budget
[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)


We've got an excel sheet with our current family budget monthly expenses. I've always wanted something more than that. Something dynamic, more .. app.. like. I'm sure there is. 100% positively sure. But I haven't looked. Because you know.. I wanted to make one my self. :bowtie: This is a really basic budget application. I mainly built it to test out Ruby on Rails, without following a tutorial.

![skjermbilde 2018-05-28 10 24 40 2](https://user-images.githubusercontent.com/16366210/40625764-a13c8474-62b4-11e8-85e5-a32d82ecfb15.png)

## Table of content
- [Motivation](#motivation)
- [Disclaimer](#disclaimer)
- [What I've built](#what-ive-built)
- [Resources](#resources)
- [Lessons learned](#lessons-learned)
- [Moving forward](#moving-forward)

## Motivation
Ok. So I want to learn RoR because it seems so easy to whip up a simple prototype of an idea with it. There is not far from beeing a rails command for doing just that.

```bash
$ rails g prototype my-idea
```
And since every aspiring developer since 2004 have used it, there are answers to every thinkable problem. I just google "rails [some issue]", and there's and SO post, a blog post or a YouTube video on it. Magnificent! Plus doing stuff in Ruby is also quite plesant.

Javascript is absolutely my language of choice though..

I want to be proficient enough in Ruby and RoR to easily and quickly make an api-project. I believe working with RoR also bring transferable knowledge since its so "easy" to work with, and I don't have to understand every piece to have fun with it.

## Disclaimer
- This application is a mess. I know. I actually think I made spaghetticode with RoR, so that's something.
- The views are crazy.
- The JS files is a mix of jQuery, ES5 and ES6. Also - No structure.
- There is no testing. What. So. Ever.
- There are bugs. They will not be fixed.
- I made this fancy README, just because..
- UX has been neglected, **badly**.
- Yes, yes i know I should'nt [use pie charts](https://www.perceptualedge.com/articles/visual_business_intelligence/save_the_pies_for_dessert.pdf)

## What I've built
It's an application to display monthly income and expenses in a family. Basically, you can make a budget and then add the people in this familiy as well as "sub" budgets like groceries, car, utillities and so on.
The initial image shows the welcome screen, after the *first-time* tour:

![skjermbilde 2018-05-28 10 24 02](https://user-images.githubusercontent.com/16366210/40625673-2ff97c90-62b4-11e8-9b8c-d9db089c7bfa.png)

![skjermbilde 2018-05-28 10 24 12](https://user-images.githubusercontent.com/16366210/40625686-4668e0b0-62b4-11e8-88ef-e42fdec10cc2.png)

There is sort of a *friendship* relation between users and Family Budgets. I based it on [this article](https://dankim.io/mutual-friendship-rails/). You can request the be a member of a budget, and as a budget owner you can invite other users.
![skjermbilde 2018-05-28 10 24 19](https://user-images.githubusercontent.com/16366210/40625730-82628ecc-62b4-11e8-9cca-4aecceb32401.png)

![skjermbilde 2018-05-28 10 24 26](https://user-images.githubusercontent.com/16366210/40625739-8bf8fcb4-62b4-11e8-8fff-385bfa575e65.png)

The empty budget welcome screen:
![skjermbilde 2018-05-28 11 44 17](https://user-images.githubusercontent.com/16366210/40625779-b39dcaba-62b4-11e8-9965-edfc60b2bc6c.png)

Creating people to populate the Family Budget. Not to be confused with other users:
![skjermbilde 2018-05-28 11 47 24](https://user-images.githubusercontent.com/16366210/40625798-c9c8f5c6-62b4-11e8-9f1f-85d9423c8ee1.png)

Sub Budgets. Where the purpose really lays..
![skjermbilde 2018-05-28 11 54 17](https://user-images.githubusercontent.com/16366210/40625806-d655bd60-62b4-11e8-8d2c-ee0536226c15.png)

The main page when the budget is up and rocking (that sounds so much better in norwegian):
![skjermbilde 2018-05-28 11 54 10](https://user-images.githubusercontent.com/16366210/40625821-e8c1c2aa-62b4-11e8-8f08-e6db06509ef4.png)

There is an optional association between *Person* budget notations and *Sub* budget notations. If it exists, editing one will edit the associated notation as well.
![skjermbilde 2018-05-28 11 54 28](https://user-images.githubusercontent.com/16366210/40625832-fb5efcca-62b4-11e8-8ddc-a9ae3f49278d.png)

If you want to do a quick test of the app, you can make a user a knock your self out, or test the premade demo-user:

| email | password |
| ------------- | ------------- |
| demo@demo.com  | demo2018  |


## Resources
- [Light Bootstrap Dashboard](https://www.creative-tim.com/product/light-bootstrap-dashboard) from Creative Tim, with all its resources.
- [Device gem](https://github.com/plataformatec/devise), for authentication. It's awesome!
- [Driver.js](https://github.com/kamranahmedse/driver.js?files=1), for the initial first-log-on-tour.

## Lessons learned
I've learned a lot. I wish somebody would've told how much more you could learn if you do stuff on your own, and don't always follow some course or tutorial (oh wait - everyone said so).
Mostly I've gained knowledge about how RoR work. I also struggled a bit initially with deploying to Heroku - deleting migration files is a bad bad thing..

But:
```bash
heroku run rails db:schema:load
```
fixed it.

I feel I've made a lot of reduntant code and I might have put logic in the wrong places. But it works for now. I can't aim for perfect on these for-fun test-projects.

Should have added tests though. Seems like a good habit.

I've used git more than erlier. Trying to start branches for new functionality. I still suck at commiting though. 


## Moving forward
I'm going to make this app again. But the next time I'm just doing a Rails API on the backend, and I want to focus on the front end. I'm thinking a Single Page App with Vue. I also want to start using Docker in my development.

