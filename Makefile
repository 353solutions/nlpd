all:
	$(error please pick a target)

env:
	# Create venv directory if not exist
	test -d venv || virtualenv venv
	./venv/bin/python -m pip install -r requirements.txt

dev-env: env
	./venv/bin/python -m pip install -r requirements-dev.txt

test:
	./venv/bin/flake8 nlp tests
	./venv/bin/python -m pytest \
	    --doctest-modules \
	    --disable-warnings \
	    --verbose \
	    nlp tests

test-ci:
	docker build -f Dockerfile.test --build-arg CI=yes .

package:
	python setup.py sdist

clean:
	rm -rf build dist nlp.egg-info
