========================
Restructured Text Viewer
========================
Restructured Text Viewer is a bash script, which simulates an rst editor/viewer with yad, rst2pdf, an editor and an pdf viewer.

Author: Tobias Blaser
Version: 1.0

what does it do
---------------
RstViewer opens a given rst file in an editor and shows an build in an pdf viewer. The pdf is be update automatically.

System requirements
-------------------
* rst2pdf installed
* an editor installed
* an pdf viewer installed
* yad installed (used for the graphical dialogs)

sudo apt-get install rst2pdf yad

Installation
------------
Copy the programm folder to /usr/local/bin and the programm launcher rstViewer.desktop in the folder to ~/.local/share/applications

Configuration
-------------
To change the editor or the pdf viewer, copy the configuration file rstViewer.conf to ~/.rstViewer/rstViewer.conf and change it to your preferences.

