cd C:\
mkdir Qt5
cd Qt5
python3 -m pip install aqtinstall
python3 -m aqt install 15.4.2 windows desktop msvc2017_64 -m qtserialport qtwidgets qtmultimedia
python3 -m aqt tool windows tools_ifw 4.0 qt.tools.ifw.40