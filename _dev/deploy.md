---
layout: concertina
title: Deployment using Travis
description: Update the website when certain builds succeed
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

**Goal**: Update a web page when a certain branch is updated

- User commits to the [translate](https://github.com/neomutt/neomutt/tree/translate) branch of the [neomutt](https://github.com/neomutt/neomutt) repo
- Translation is checked
- Update website:
  * clone repo [neomutt.github.io](https://github.com/neomutt/neomutt.github.io)
  * generate webpage
  * commit webpage
  * push to GitHub

Some names have been replaced in the examples below:

| Variable         | Value                  | Description                       |
| :--------------- | :--------------------- | :-------------------------------- |
| **USER**         | neomutt                | Name of your user or organisation |
| **SRC_REPO**     | neomutt                | Name of the source repo           |
| **DST_REPO**     | neomutt.github.io      | Name of the destination repo      |
| **SSH_KEY_NAME** | travis-deploy-github   | Descriptive name for your SSH key |

### tl;dr

- [travis yml](https://github.com/neomutt/neomutt/blob/translate/.travis.yml)
- [prep.sh](https://github.com/neomutt/neomutt/blob/translate/.travis/prep.sh)
- [generate-webpage.sh](https://github.com/neomutt/neomutt/blob/translate/.travis/generate-webpage.sh)

## Create Identity

Create an SSH key.
This will be given write privileges to our GitHub repo.

**Note**: Do not set a password on this key.  It will be encrypted later.

```
ssh-keygen -t rsa -b 4096 -f SSH_KEY_NAME
```

```reply
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in SSH_KEY_NAME.
Your public key has been saved in SSH_KEY_NAME.pub.
The key fingerprint is:
SHA256:0LFkuR0vAde+0HMYAI7GxzD/dFgI+oUXJGjXWri/mqs user@example.com
The key's randomart image is:
+---[RSA 4096]----+
|      o.OO=+.    |
|     .o%+**+o    |
|     .*.O*=*.o   |
|     . ++=+.* .  |
|        S..o +   |
|          . .    |
|           .     |
|         ..      |
|      E.+o       |
+----[SHA256]-----+

```

## Give Permissions to Identity

Allow the SSH key to write to one specific repo.

- **Open**: https://github.com/**USER**/**DST_REPO**/settings/keys
- Add deploy key
  * Title: "Updates from Travis"
  * Key: "ssh-rsa VERY-LONG-RANDOM-STRING user@example.com"
  * Tick: "Allow write access"
  * Click: "Add key"

For extra secrity add branch protection.

- **Open**: https://github.com/**USER**/**DST_REPO**/settings/branches
- Protected branches
- master
  * Protect this branch
  * Save changes

This prevents anyone from doing force-pushes to the repo.
If anything goes wrong with the deployment, it can only **add** commits to the repo (which can be undone).

## Set up Travis

To use the SSH key securely, it must be encrypted.
This is done using the travis command (a Ruby gem).

First install the "rubygems" package on your machine.

Now, install the travis command line (your output may be different).

```
gem install travis
```

``` reply
gem install travis
Fetching: travis-1.8.8.gem (100%)
Successfully installed travis-1.8.8
Parsing documentation for travis-1.8.8
gnstalling ri documentation for travis-1.8.8
Done installing documentation for travis after 18 seconds
2 gems installed
```

Encrypt the private part of the SSH key (the part with no suffix).

**Note**: Save the "openssl" command, it will be used later.

```
travis encrypt-file -r USER/SRC_REPO SSH_KEY_NAME
```

```reply
encrypting SSH_KEY_NAME for USER/SRC_REPO
storing result as SSH_KEY_NAME.enc
storing secure env variables for decryption

Please add the following to your build script (before_install stage in your .travis.yml, for instance):

    openssl aes-256-cbc -K $encrypted_XXXXXXXXXXXX_key -iv $encrypted_XXXXXXXXXXXX_iv -in SSH_KEY_NAME.enc -out SSH_KEY_NAME -d

Pro Tip: You can add it automatically by running with --add.

Make sure to add SSH_KEY_NAME.enc to the git repository.
Make sure not to add SSH_KEY_NAME to the git repository.
Commit all changes to your .travis.yml.
```

When Travis encrypts the files, it saves two keys to its server.

See the "Environment Variables", here: https://travis-ci.org/**USER**/**SRC_REPO**/settings
- `encrypted_XXXXXXXXXXXX_iv`
- `encrypted_XXXXXXXXXXXX_key`

Our SSH key can only be decrypted in **SRC_REPO**.

For more information about encryption in Travis, see: [https://docs.travis-ci.com/user/encrypting-files](https://docs.travis-ci.com/user/encrypting-files/)

## Create Scripts

Now, we need some scripts to do the actual work.

The build environment needs setting up to allow ssh and git to work correctly.

### Prepare ssh

- [prep.sh](https://github.com/neomutt/neomutt/blob/translate/.travis/prep.sh)

**Note**: It would be better to cache a copy of GitHub's ssh key fingerprint.

```
mkdir -p ~/.ssh
echo "Host github.com" >> ~/.ssh/config
echo "        StrictHostKeyChecking no" >> ~/.ssh/config
chmod 600 ~/.ssh/config
```

### Prepare ssh-agent

Decrypt the SSH key and run the ssh-agent.
This uses the "openssl" command we saved earlier.

**Note**: This happens in `.travis.yml` so that the ssh-agent credentials are visible to other scripts.

```
openssl aes-256-cbc -K $encrypted_XXXXXXXXXXXX_key -iv $encrypted_XXXXXXXXXXXX_iv -in SSH_KEY_NAME.enc -out SSH_KEY_NAME.pem -d
chmod 0400 SSH_KEY_NAME.pem
eval "$(ssh-agent -s)"
ssh-add SSH_KEY_NAME.pem
```

### Prepare git

- [travis yml](https://github.com/neomutt/neomutt/blob/translate/.travis.yml)

Set up out git credentials and clone the destination repo.

**Note**: We use the "git@" reference for the repo.

```
git config --global user.email "user@example.com"
git config --global user.name "John Doe (DEPLOY)"

git clone git@github.com:USER/DST_REPO ~/website
```

### Do the work

- [generate-webpage.sh](https://github.com/neomutt/neomutt/blob/translate/.travis/generate-webpage.sh)

This script does the actual work -- generate a webpage.

### Commit your changes

- [travis yml](https://github.com/neomutt/neomutt/blob/translate/.travis.yml)

Finally, commit our changes and push them.

**Notes**:
- We've chosen to label the commits "[AUTO]"
- The commits won't trigger a link-check of the entire site "[ci skip]"

```
cd ~/website
git add .
git commit -m "[AUTO] commit message" -m "[ci skip]"
git push origin
```

## Result

Every time a translater makes an update, the [leaderboard](https://neomutt.org/translate) is updated.

