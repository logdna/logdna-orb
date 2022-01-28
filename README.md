# LogDNA Orb
LogDNA is a highly scalable log management solution that indexes, aggregates, and analyzes log data.
The [CircleCI Orb](https://circleci.com/docs/2.0/orb-intro/) plugin enables CircleCI logs to be sent directly to LogDNA.
Learn more about LogDNA: [logdna.com](https://www.logdna.com/)

## Requirements
* A LogDNA account. Create a LogDNA account [here](https://logdna.com/sign-up/)
* A CircleCI account. Create a CircleCI account [here](https://circleci.com/signup/).

## Usage

To use the LogDNA Orb, reference it in your project and then use one of the included commands:
* `notify`: Notify LogDNA of the Build Event
* `report`: Report the Status of the Build
* `enablek8slogging`: Enable Kubernetes Logging via LogDNA Agent
	* **Requirement**: `kubectl` must be installed before the execution of the command

Documentation for each method is available inline in [orb.yml](https://github.com/logdna/logdna-orb/blob/master/src/logdna/orb.yml).

Here's a very simple example of a CircleCI Config using LogDNA Orb:

```yaml
version: 2.1
orbs:
    logdna: logdna/logdna@0.0.1
jobs:
  build:
    machine: true
    environment:
      LOGDNA_KEY: {{ Your LogDNA Ingestion Key Here }}
    steps:
      - checkout
      # Notify LogDNA @ the Start of the Job via cURL:
      - logdna/notify
      # Enable Kubernetes Logging via LogDNA Agent
      - logdna/enablek8slogging

     # The Rest of Your Build Steps...

     # Report to LogDNA @ the End of the Job via cURL:
      - run:
          name: Export Failure
          command: echo 'export FAILURE=true' >> ${BASH_ENV}
          when: on_fail
      - run:
          name: Export Success
          command: echo 'export FAILURE=false' >> ${BASH_ENV}
          when: on_success
      - logdna/report:
          failure: ${FAILURE}
```

## Release Process

To validate any changes to the Orb locally you can use the included
`validate.sh` shell script in the repository, it will pack the individual
files together to a proper Orb and then run the validate command
from the `circleci` cli tool on the result.

```shell
cat validate.sh
#!/bin/sh

circleci config pack src | circleci orb validate -
```

All published branches will trigger publishing under a alpha reference
under the logdna namespace for the logdna Orb. It can be referenced
as follows:

```shell
logdna/logdna@dev:${CIRCLE_BRANCH}
e.g.
logdna/logdna@dev:master
```

To release a properly tagged version of the Orb push a semantic versioned
git tag to Github and the workflow to release this version will be started.

```shell
git tag 1.2.3 -m "Release version 1.2.3 of the LogDNA CircleCI Orb"
git push --tags
```

## How to test

Before tagging the tree for release we need to perform some testing. The
easiest way is to set the version of the Orb in your .circleci/config.yml file
to the floating tag, i.e. `logdna/logdna@dev:master` for the  master branch, and
run the job. Then look for any regressions, if not we are good to go and you
can tag the tree and push to Github.

## Help / Support

If you run into any issues, please email us at [support@logdna.com](mailto:support@logdna.com)

For bug reports, please [open an issue on GitHub](https://github.com/logdna/logdna-orb/issues/new).

## Contributing

For details on how to do development work on a CircleCI orb, check out [Circle CI's Orb docs](https://circleci.com/docs/2.0/creating-orbs/).

To contribute to the LogDNA orb:

1. [Fork it](https://github.com/logdna/logdna-orb)
2. Create your feature branch (```git checkout -b my-new-feature```).
3. Commit your changes (```git commit -am 'Added some feature'```)
4. Push to the branch (```git push origin my-new-feature```)
5. Create a new Pull Request and submit it for review.
