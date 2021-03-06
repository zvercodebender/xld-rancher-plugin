# XL Deploy Rancher plugin

[![Build Status][xld-rancher-plugin-travis-image]][xld-rancher-plugin-travis-url]
[![License: MIT][xld-rancher-plugin-license-image]][xld-rancher-plugin-license-url]
![Github All Releases][xld-rancher-plugin-downloads-image]
![Codacy Badge][xld-rancher-plugin-codacy-image]
![Maintainability][xld-rancher-plugin-codeclimate-image]

[xld-rancher-plugin-travis-image]: https://travis-ci.org/xebialabs-community/xld-rancher-plugin.svg?branch=master
[xld-rancher-plugin-travis-url]: https://travis-ci.org/xebialabs-community/xld-rancher-plugin
[xld-rancher-plugin-license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
[xld-rancher-plugin-license-url]: https://opensource.org/licenses/MIT
[xld-rancher-plugin-downloads-image]: https://img.shields.io/github/downloads/xebialabs-community/xld-rancher-plugin/total.svg
[xld-rancher-plugin-codacy-image]: https://api.codacy.com/project/badge/Grade/4212b8dfa4cd4cb6893322b162261f31
[xld-rancher-plugin-codeclimate-image]: https://api.codeclimate.com/v1/badges/eba93f02daa52c542267/maintainability

## Preface

This document describes the functionality provided by the XL Deploy Rancher plugin.

See the [XL Deploy reference manual](https://docs.xebialabs.com/xl-deploy) for background information on XL Deploy and deployment automation concepts.  

## Overview

This XL Deploy plugin creates and upgrades Rancher stacks.

## Requirements

* XL Deploy 6.0+

## Installation

* Copy the latest JAR file from the [releases page](https://github.com/xebialabs-community/xld-rancher-plugin/releases) into the `XL_DEPLOY_SERVER/plugins` directory.
* Restart the XL Deploy server.


## Usage

### Configure the CLI interface ###

Set up a rancher.RancherCliClient object with Rancher server URL, access key, and secret key.  This object can be located under an overthere.Host object.

![Screenshot of RancherCliClient](images/RancherCliClient.png)

### Configure the REST interface ###

As an alternative to the CLI, you can define a rancher.RancherRestClient object in the Infrastructure tree.  It can be located under the root node or any folder.  Set the host (DNS or IP), port, access key, and secret key.

![Screenshot of RancherRestClient](images/RancherRestClient.png)

### Configure the Rancher Compose Archive

To configure a rancher.CliComposeArchive or rancher.RestComposeArchive object for deployment:

* Create a docker-compose.yml file and a rancher-compose.yml file.  

* Zip them into a single archive to be used as the artifact.

* Specify the project id or name.

* Specify the stack name. 

* Enter the names of the services that should be upgraded under a MODIFY or NOOP deployment.

* Set the force-upgrade and confirm-upgrade booleans for CLI upgrades.

* Set the uniqueMatchOnly flag to true for REST deployments if the deployment should abort on multiple matches for the project and/or stack names.

![Screenshot of CLI Compose Archive](images/CliComposeArchive.png)

![Screenshot of REST Compose Archive](images/RestComposeArchive.png)

### Deploying ###

Deploy the rancher.ComposeArtifact to the rancher.RancherCliClient or to the rancher.RancherRestClient in order to create, update, upgrade, or delete the corresponding object on Rancher.

### Mapping of XL Deploy actions to Rancher actions #####

**CLI**

* CREATE -- implemented to create a stack

* MODIFY/NOOP -- implemented to upgrade the listed services

* DESTROY -- implemented to remove a stack

**REST**

* CREATE -- implemented to create a stack

* MODIFY/NOOP -- implemented to upgrade the listed services

* DESTROY

