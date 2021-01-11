# maintemplateV2

Builds main, mod and sys repo into one binary.

Dev NOTE: new code happen sin main/client and main/server.

## Run

**Follows these steps :**


- `export CONFIG_PASSWORD="mypass123"` (Define a CONFIG_PASSWORD env var to encrypt and decrypt config file)
- `make all`
- `make run-server`


If anything goes wrong, go for a little clean :

`make clean`

.. and then `make all` again.

The client listens on port `8080`, you can access it on https://localhost:8080.
