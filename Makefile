REPODIR=$(shell pwd)

default: env

env:
	python3 -m venv env
	env/bin/pip install --upgrade pip setuptools wheel
	env/bin/pip install -r requirements.txt

.PHONY: clean dev lab

clean:
	rm -rf env

dev:
	env/bin/pip install jupyterlab jupyterlab-vim jupyterlab-lsp 'python-language-server[all]'

lab:
	env/bin/jupyter lab --port=8584
