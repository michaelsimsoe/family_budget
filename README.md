# Family Budget
[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)


We've got an excel sheet with our current family budget monthly expenses. I've always wanted something more than that. Something dynamic, more .. app.. like. I'm sure there is. 100% positively sure. But I haven't looked. Because you know.. I wanted to make one my self. :bowtie: This is a really basic budget application. I mainly built it to test out Ruby on Rails, without following a tutorial.

![skjermbilde 2018-05-28 11 43 10 2](https://user-images.githubusercontent.com/16366210/40615535-76d517dc-6287-11e8-9fa9-9686b2f162c0.png)

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

## What I've built

## Resources
- [Light Bootstrap Dashboard](https://www.creative-tim.com/product/light-bootstrap-dashboard) from Creative Tim
- Device gem, for users. It's awesome

## Lessons learned
I've learned a lot. I wish somebody would've told how much more you could learn if you do stuff on your own, and don't always follow some course or tutorial (oh wait - everyone said so).
Mostly I've gained knowledge about how RoR work. I also struggled a bit initially with deploying to Heroku - deleting migration files is a bad bad thing..

But:
```bash
heroku run rails db:schema:load
```
fixed it.

I've used git more than erlier. Trying to start branches for new functionality. I still suck at commiting though. 


## Moving forward
I'm going to make this app again. But the next time I'm just doing a Rails API on the backend, and I want to focus on the front end. I'm thinking a Single Page App with Vue. I also want to start using Docker in my development.

