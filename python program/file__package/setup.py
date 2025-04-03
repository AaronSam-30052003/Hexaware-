# setup.py
from setuptools import setup, find_packages

setup(
    name='my_package',
    version='0.1',
    author_email='aaronvsam289@gmail.com',
    packages=find_packages(),
    install_requires=[
        'pandas',
        'openpyxl',
    ],
    entry_points={
        'console_scripts': [
            'file_package = file_package.__init__:main',
        ],
    },
)
