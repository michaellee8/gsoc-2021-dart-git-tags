A rudimentary sample demonstrating the git partial clone + sparse checkout method.

## What does it do

1. Given a git url and a path to package
2. perform a partial clone of the repo to the disk (without all trees and blobs)
3. perform a sparse checkout on the required pubspec.yaml
4. loop through all tags to scrape all applicable pubspec.yaml
5. all found version of the discovered package.

## System requirement

`git clone --sparse` requires at least git 2.25.0, below benchmarks are running in git 2.30.2

## Usage

```bash
dart main.dart <url to git repo> <path to package>
```

```bash
# Simple example, still took 277 seconds on 53 tags
dart main.dart https://github.com/rrousselGit/provider /

# Heavy load test, would take quite a lot of time to complete
dart main.dart https://github.com/flutter/plugins packages/camera/camera
```

## Evaluation

Currently the performance is not quite acceptable, in a Google Cloud Shell environment, it took about 8 seconds for
initialization and extra 5 seconds for each tag it has to fetch. There are different techniques to optimize this, for
example to fetch multiple instances of such repo concurrently and to limit the number of tags required to process by
doing pattern matching on tags to be scanned.
