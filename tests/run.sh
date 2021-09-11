set -e


# set up conda env
# https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
# TRAVIS=TRUE
if test $TRAVIS
then
    source $HOME/miniconda/etc/profile.d/conda.sh
fi


TRAVIS=TRUE
# run test
python test_main.py wgNiGj1nGYE
bash -x test_cli.sh
