<h1>Feature Development Workflow</h1>

## Introduction

Let's step through the feature development workflow covered earlier in this documentation.  This time, we'll cover each step in enough detail for you to fully accomplish the task with [this set of tools](tools.md).

*Please note: This document as a whole is not a substitute for learning Chef Development.  What's covered in this doc is an overview of our current process.*

## Workflow

### 1. Write feature tests

Read this first: [Server Specs](server-specs.md)

Then:

1. Decide on the test type to write
    - Consider the test examples you just read about
    - Tie the tests to the feature and the acceptance criteria / specifications
    - Steps below will assume Server Spec
    - Other types may be added
2. Decide whether the test/tests should be part of an existing test suite or a new one
    - If you decide to add a new test suite, you may run the task below to add a new server spec file:
        - `rake add:spec name="Test Name" desc="Test Description"`
3. Write your tests
    - When you don't know how to test something yet, but know the specification, [write pending test descriptions](#)

### 2. Clean up old work

Run `kitchen destroy` to clean up old work

### 3. Create a test box and provision it with our cookbook

Run `kitchen converge`

### 4. Run all tests on the box

Run `kitchen verify`

Review test results to determine what tests are not passing and what needs changed to make them pass.

### 5. Use community cookbook recipes or write/edit our own in order to add functionality which meet our requirements

#### - To add a new recipe to the 7-Iron Cookbook run the following:

~~~shell
rake add:recipe name="Recipe Name"
~~~

#### - To add a new community cookbook recipe:

1.  Add the cookbook as a dependency in `metadata.rb`
  - Cookbook version numbers are desired but not required.
2. Download new and updated cookbooks
  - Run `berks update`

#### - Lint

You can use the foodcritic lint tool on the cookbook by running:

~~~shell
rake style:chef
~~~

#### Add Recipes to Run List

See  [7-Iron::default](/cookbook-readme/#7-irondefault)

### 6. Re-provision

Run `kitchen converge`

Any changes to a recipe or new recipes will be converged into the box.  This is done through [kitchen converge](http://kitchen.ci/docs/getting-started/running-converge).

Kitchen Converge incrementally adds changes to a provisioned Vagrant box.  This tool significantly speeds up our development process.  We do not have to wait for a full provision for every change we want to test.

Note: Use kitchen converge during recipe development but make sure to test the final recipe on a fully clean instance.  
There are times when developing with kitchen converge that you will get a passing test on a second or follow-up converge that did not pass after an initial run.  Usually this is due to the order of recipes during provision.

Make sure you do your final testing on a clean (not previously converged) box.
Use: `kitchen test` instead of `kitchen converge` and `kitchen verify`

### 7. Repeat `4`, `5`, and `6` (committing iterative changes as needed) until complete

### 8. Test with Kitchen Test

Run: `kitchen test`

Kitchen test will destroy any previous states, start at a new state, and verify the box from scratch.
