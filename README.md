# tfe_agent

Chef cookbook to setup and run a Terraform Cloud agent using docker.

## Getting Started

Follow the steps to [Create a new Agent Token](https://www.terraform.io/docs/cloud/workspaces/agent.html#create-a-new-agent-token) to obtain an agent token, add this recipe to your run list and set the token as the `['tfc_agent']['token']` attribute.

## Resources

### `tfc_agent`

The `tfc_agent` resource is responsible for fetching and running a Terraform Cloud Agent docker image.

#### Actions

default_action :run

* `:create` -  Pulls the container image.
* `:start` - Starts running the container.
* `:run` - The default action. Does both `:create` and `:start` in a single in action.
* `:stop` - Stops the running container.
* `:remove` - Removes the cached image.

#### Properties

The name property is used to set the

* `image` - The container image to use. Defaults to `hashicorp/tfc-agent`.
* `tag` - The image tag to use. Defaults to `latest`.
* `token` - The agent token to use.

#### Examples

Minimal usage:

```ruby
tfc_agent "MyOrgAgent" do
  token 123123123...
end
```

Complete example:

```ruby
tfc_agent "MyCustomAgent" do
  image 'myorg/tfc-agent'
  tag   '2.0'
  token 123123123...
end
```

## Versioning

This cookbook uses [Semantic Versioning 2.0.0](http://semver.org/).

Given a version number MAJOR.MINOR.PATCH, increment the:

* MAJOR version when you make functional cookbook changes,
* MINOR version when you add functionality in a backwards-compatible manner,
* PATCH version when you make backwards-compatible bug fixes.

## Contributing

We welcome contributed improvements and bug fixes via the usual work flow:

1. Fork this repository
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new pull request

## License and Authors

Authors and contributors:

* Stephen Hoekstra <shoekstra@schubergphilis.com>

```
Copyright 2020 Stephen Hoekstra <stephenhoekstra@gmail.com>
Copyright 2020 Schuberg Philis

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
