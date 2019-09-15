# Ports test project

## Exercise description

The task is to build a simple **Rails API** project. Its functionality is as follows:
* For authorized users, there must be an import functionality of **ports**. The expected file format is CSV. Some examples are located in the `/samples` folder. - YES/NO
* The API should provide an ability to search through ports in a various ways (e.g. port name entries, port type, etc.). - NO
* Documentation and code specs are expected to be present. - OK

## Notes
* Ports are unique by **code**. - YES
* The ID field should be omitted from the import files. - YES
* Any imported files should not be stored after processing. - YES
* Some attributes of ports aren't important for the task (e.g. city). However, everything should be stored in database. - YES
* The authentication method is up to you, feel free to use anything that seems appropriate and safe. -NO

## Technical details
* Ruby/Rails: latest (stable) version (at the moment of starting this exercise).
* Database: `PostgreSQL 9.6+`
* Documentation/testing: feel free to use your favorite tools.
* There's no limitation in using open source gems. You're welcome to add anything that suits best.
* The exercise should be published on your favorite public git repository (e.g. Gitlab, Github, Bitbucket, etc.).

Good luck and we are looking forward to seeing your app!

Regards,

**Shypple dev team**
