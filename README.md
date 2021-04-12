# pybootstrap

Project with bootstrap files to create one python project

## How this works

For now, we don't have any automation to create your project. Just copy and past to your new empty project.

Main features:

 * Unit tests
 * Dockerfile
 * Pylint

## Tests

### For unit tests:

```sh
make check parameters="<filepath>.py <Class>.<Function>"
```
`parameters filepath init after ./tests`

#### Examples

- All tests
  ```sh
  make check
  ```

- File test
  ```sh
  make check parameters="middleware_test.py"
  ```

- Class of file test
  ```sh
  make check parameters="middleware_test.py ProcessRequestTests"
  ```
  
- Function of class of file test:
  ```sh
  make check parameters="middleware_test.py ProcessRequestTests.test_get_proxy"
  ```

### For integration tests:

```sh
make check-integration parameters="<filepath>.py <Class>.<Function>"
```
`parameters filepath init after ./tests`

Same unit tests examples works to integration tests.

## lint

To run pylint in your code run:

    make lint