#!/bin/bash
PYTHON=$(which python2.7)
SITE_PACKAGES=$($PYTHON -c "from distutils.sysconfig import get_python_lib; print(get_python_lib('x86_64'))")
PYTHON_VERSION=$(echo $SITE_PACKAGES | egrep -o 'python[0-9]+\.[0-9]+')
virtualenv -p $PYTHON .venv
cp -r selinux .venv/lib/${PYTHON_VERSION}/site-packages/.
source .venv/bin/activate
echo "Installing dependencies... (pip -q install -r requirements.txt)"
pip -q install -r requirements.txt
