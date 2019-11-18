# academy-exerciseTemplates
This repo will house the exercise templates

This repository will be cloned by the C1P engine and it will be expecting a configuration file called
"config.json" in the root folder of this repository.

The config.json file will be the configuration of the C1P job that will be run, thereby enabling each branch (for the various modules) to have its own configurations.

Each branch will be expecting optionally the following files
Apex-Data.cls
Apex-Metadata.cls

These files must be reference in the config.json file so that they can be executed by the C1P job.
