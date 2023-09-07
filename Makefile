make: install

PACKAGE_NAME := obsidian-traverse

clean:
	rm -rf build dist __pycache__ *.egg-info

dist: clean
	python3 setup.py sdist bdist_wheel

upload: dist
	python3 -m twine upload dist/*

install: dist
	-pipx uninstall $(PACKAGE_NAME) && pipx install dist/*.whl; [ $$? -eq 127 ] && pip install --force-reinstall --no-deps dist/*.whl

format:
	black *.py --line-length 100

.PHONY: clean dist upload install
