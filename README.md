# Hubot Keys [![Build Status](https://img.shields.io/travis/catops/hubot-keys.svg?maxAge=2592000&style=flat-square)](https://travis-ci.org/catops/hubot-keys.svg?branch=master) [![npm](https://img.shields.io/npm/v/hubot-keys.svg?maxAge=2592000&style=flat-square)](https://www.npmjs.com/package/hubot-keys)

:cat2: Store users' public SSH keys in Hubot.

![hubot-keys screenshot](screenshot.png)

## Installation

Add **hubot-keys** to your `package.json` file:

```json
"dependencies": {
  ...
  "hubot-keys": "latest"
}
```

Add **hubot-keys** to your `external-scripts.json`:

```json
["hubot-keys"]
```

Run `npm install hubot-keys`


## Commands

```
hubot my public key is <public_ssh_key> - Stores the user's public SSH key.
hubot what is (my|<username>) public key - Returns the user's public SSH key.
hubot (delete|remove|forget) my public key - Removes the user's public SSH key.
```

This plugin can be used in other Hubot scripts by calling the method `robot.keys.keyForUserName(<username>)`
or `robot.keys.keyForUserId(<userId>)` to get a user's public SSH key.

----

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
