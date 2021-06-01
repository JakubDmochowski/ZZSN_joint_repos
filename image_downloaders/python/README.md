## Python public webcam image scrapper

## installation

Make sure you install dependencies inside python virtual environment.

If you do not have virtualenv:

create virtual env with command:
python3 -m venv ./virtualenv

then activate it inside a console:

- on Windows:
  ./virtualenv/Scripts/Activate.ps1
  or
  ./virtualenv/Scripts/activate.bat

- on Linux:
  ./virtualenv/Scripts/activate

python3 -m pip install -r requirements.txt

## usage

python3 get_images.py

then for URLS use syntax:
https://www.webcamgalore.com/complete-<alphabet_letter>.html
example:
https://www.webcamgalore.com/complete-v.html
