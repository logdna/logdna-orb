# LogDNA Orb
[CircleCI Orb](https://github.com/CircleCI-Public/config-preview-sdk/tree/master/docs) for Reporting Deploys to LogDNA.

## Requirements
If you don't have them already, create accounts in [LogDNA](https://logdna.com/sign-up/) and [CircleCI](https://circleci.com/signup/).

## Usage

To use the LogDNA Orb, reference it in your project and then use one of the included commands:
* `notify`: Notify LogDNA of the Build Event via cURL
* `report`: Report the Status of the Build via cURL
* `enablek8slogging`: Enable Kubernetes Logging via LogDNA Agent

Documentation for each method is available inline in [orb.yml](https://github.com/logdna/logdna-orb/blob/master/src/logdna/orb.yml).

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
