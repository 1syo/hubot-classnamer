[![Build Status](http://img.shields.io/travis/1syo/hubot-classnamer.svg?style=flat)](https://travis-ci.org/1syo/hubot-classnamer)
[![Coverage Status](http://img.shields.io/coveralls/1syo/hubot-classnamer.svg?style=flat)](https://coveralls.io/r/1syo/hubot-classnamer)
[![Dependencies Status](http://img.shields.io/david/1syo/hubot-classnamer.svg?style=flat)](https://david-dm.org/1syo/hubot-classnamer)

# hubot-classnamer

Class name generator.

See [`src/classnamer.coffee`](src/classnamer.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-classnamer --save`

Then add **hubot-classnamer** to your `external-scripts.json`:

```json
["hubot-classnamer"]
```

## Sample Interaction

```
user1>> hubot class me
hubot>> AutomaticFileBundle
```
