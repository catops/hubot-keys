# CatOps Keys [![Build Status](https://img.shields.io/travis/catops/catops-keys.svg?maxAge=2592000&style=flat-square)](https://travis-ci.org/catops/catops-keys.svg?branch=master) [![npm](https://img.shields.io/npm/v/catops-keys.svg?maxAge=2592000&style=flat-square)](https://www.npmjs.com/package/catops-keys)

:cat: Store users' public keys in Hubot

## Installation

Add **catops-keys** to your `package.json` file:

```json
"dependencies": {
  ...
  "catops-keys": "latest"
}
```

Add **catops-keys** to your `external-scripts.json`:

```json
["catops-keys"]
```

Run `npm install catops-keys`


## Commands

```
hubot my key is <public_ssh_key> - Stores the user's public SSH key.
```

A user's key can be found at `msg.message.user.key`.

----

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
