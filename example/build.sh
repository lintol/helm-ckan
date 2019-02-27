#!/bin/bash

source $CKAN_VENV/bin/activate && cd $CKAN_VENV/src/

git clone https://github.com/lintol/ckanext-oauth2provider
cd ckanext-oauth2provider
pip install -r dev-requirements.txt
python setup.py install
python setup.py develop
cd ..

git clone https://github.com/ckan/ckanext-scheming.git
cd ckanext-scheming
pip install -r requirements.txt
python setup.py install
python setup.py develop
cd ..

git clone https://github.com/lintol/ckanext-validation.git
cd ckanext-validation
git checkout feature/lintol
rm -rf ckanext/validation/fanstatic/vendor/lintol-reporting-ui
git clone https://github.com/lintol/lintol-reporting-ui ckanext/validation/fanstatic/vendor/lintol-reporting-ui
pip install -r requirements.txt
pip install -r lintol-requirements.txt
python setup.py install
python setup.py develop
cd ..
