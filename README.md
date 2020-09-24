# Password Generator | Taylor

Why Use This Password Generator?
- single command
- copies to clipboard
- saves to local file (pass, use_case, timestamp)
- base64 encryption

## Installation

```bash
git clone https://github.com/rbrtbrnschn/password_generator
cd password_generator
chmod +x install.sh
./install.sh
```

## Usage

```bash
pass-gen [-sql]
```

> **[-s]** : creates a single password

> **[-q]** : removes the necessity of inputing a USE_CASE

> **[-l]** : changes password length to the given argument (ie. pass-gen -l 10)


### todo-list

* [X] ask for use case (ie. facebook.com)
* [x] save password
* [x] save according timestamp
* [x] setup flags for ./index.sh
* [x] allowing execution anywhere
* [x] auto installation and uninstall scripts
* [x] write how to install guide

