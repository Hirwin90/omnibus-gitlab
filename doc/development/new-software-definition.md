# Adding a new Software Definition to Omnibus GitLab

In order to add a new component to GitLab, you should follow these steps:

1. [Fetch and compile the software during build](#fetch-and-compile-the-software-during-build)
2. [Add a dependency for the software definition to another component](#add-a-dependency-for-the-software-definition-to-another-component)

## Fetch and compile the software during build

[Software Definitions](../architecture/README.md#software-definitions), which
can be found in `/config/software`, specify where omnibus should fetch the
software, how to compile it and install it to the required folder. This part of
the project is run when we build the Omnibus package for GitLab.

When adding a component that should be fetched from git the clone address of the
repositories of the local mirror and upstream should be added to
`/.custom_sources.yml`.

See other Software services in the directory for examples on how to include your
software service.

## Add a dependency for the software definition to another component

Add a `dependency` statement to the definition of the gitlab project found in
`/config/projects/gitlab.rb`, unless there is a more specific component it makes
sense to be a dependency of (eg `config/software/gitlab-rails.rb` for a
component only needed by `gitlab-rails`)