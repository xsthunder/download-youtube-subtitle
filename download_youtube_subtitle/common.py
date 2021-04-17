
#################################################
### THIS FILE WAS AUTOGENERATED! DO NOT EDIT! ###
#################################################
# file to edit: ./nb/common.ipynb

import os
import time

IN_TRAVIS=(os.getenv('TRAVIS', False) == 'true')

#https://stackoverflow.com/questions/15411967/how-can-i-check-if-code-is-executed-in-the-ipython-notebook
def isnotebook():
    try:
        shell = get_ipython().__class__.__name__
        if shell == 'ZMQInteractiveShell':
            return True   # Jupyter notebook or qtconsole
        elif shell == 'TerminalInteractiveShell':
            return False  # Terminal running IPython
        else:
            return False  # Other type (?)
    except NameError:
        return False      # Probably standard Python interpreter
IN_JUPYTER = isnotebook()

def save_notebook():
    ex_js_cmd('IPython.notebook.save_checkpoint();')

def restart_kernel():
    ex_js_cmd('IPython.notebook.kernel.restart();')

def kill_kernel():
    ex_js_cmd('IPython.notebook.kernel.kill();')

def ex_js_cmd(cmd):
    from IPython.display import display, Javascript
    display(Javascript(cmd))
    
def save_and_export_notebook(name):

    assert IN_JUPYTER

    save_notebook()
    NOTEBOOK_EXTEND_NAME='.ipynb'
    if NOTEBOOK_EXTEND_NAME not in name:
        name += NOTEBOOK_EXTEND_NAME
    time.sleep(1)

    # support import complie
    ip = get_ipython()
    ip.run_cell(f'!python notebook2script.py {name}')
    ip.run_cell(f'!python notebook2test_script.py {name}')

    save_notebook() # for exitting
