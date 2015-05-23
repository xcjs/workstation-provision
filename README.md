Workstation Provision
=====================

Workstation Provision provides scripts used to 
automate the setup of new computer workstations 
with a heavy bias toward my own personal 
preferences.

You are free to fork this repository and make your 
own customizations. The goal is to make customization 
possible using the conf subdirectory available under 
each supported platform.

Each supported platform and version contains 
a directory in the root of the project in the
following format:

	operating_system-semantic.version/

Each root directory contains a platform-specific 
script named provision.*

Executing provision will install preferred applications,
customize selected settings, and prepare a workstation
for preferred tasks.

Workstation Provision was intended to assist with new
systems or aid in migrating from different workstations
to help with initial setup.
