<h1>Contributor Guide Overview</h1>

## Introduction

*Documentation for those who develop and maintain the 7-Iron codebase.*

## Development Cycle in a Nutshell

1. Users request a new feature and provide specifications for some functionality
2. New feature is approved and prioritized for development
3. Create a feature branch off the `develop` branch
4. Write tests (specifications) which describe and verify the functionality
5. Run the test to see what parts fail in order to know what we need to change on the system
6. Add recipes to our run list and change attributes until the system passes our tests
7. Open a pull request to merge the new feature into the `develop` branch
8. Ask for a code review from another contributor
8. All tests should run against the develop branch with the new merged feature (I will try to setup travic ci to do this)
10. Upon passing all tests, the new feature may be merged into `master` by a lead contributor
11. When time for a new release, the new release tag is added to `master`
12. A Vagrant file and box are created which are specific to the release (version number)
13. The new box version is deployed
14. Master is merged back into develop

Note: We have a Rake task which uses Packer to build our box.  The box name includes the branch, tag, and git commit id from which it was built.

## Feature Development Workflow (Summary)

1. Write feature tests
2. Clean up old work
3. Create a test box and provision it with our cookbook
4. Run all tests on the box
5. Use community cookbook recipes or write/edit our own in order to add functionality which meet feature requirements
6. Re-provision
7. Repeat `4`, `5`, and `6` (committing iterative changes as needed) until complete
8. Run a final clean test from scratch

See: The full [Feature Development Workflow ](feature-development.md)
