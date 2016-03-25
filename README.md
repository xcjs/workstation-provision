# Workstation Provision

Workstation Provision provides scripts used to automate the setup of new
computer workstations with a heavy bias toward my own personal preferences.

You are free to fork this repository and make your own customizations. The goal
is to make customization possible using the various subdirectories available
under each supported platform.

## Root Path Format

Each supported platform and version contains a directory in the root of the
project in the following format:

	{{operating_system-version}}/{{workstation-type}}/

Each OS directory contains a platform-specific script named provision.*

## Workstation Path Specification

Each {{workstation-type}}/ directory will contain pre-set sub-directories and
files. These can be considered the definitive standard that the workstation
provision scripts must support.

* functions/
* installers/
* lib/
* lst/
* post/
* pre/
* sequence/
* provision.*
* Vagrantfile

### functions/

functions/ includes reusable functions to be used within the provisioning
scripts sourced from separate script files. Only one function can be exported
per file and it must match the name of the file not including the file
extension.

Private or sealed functions are fine to include within the file.

### installers/

installers/ contains standalone scripts that are responsible for installing one
application, tool, or collective set of tools.

The components installed are typically not available via an OS-specific
package manager or software channel.

### lib/

lib/ contains third party standalone scripts.

### lst/

lst/ contains LST files, which in turn list packages, package sources,
and other repeatable items. Every provision configuration should at least
specify a packages.lst

LST files:
* end with an .lst file extension
* include one item per line
* ignore lines beginning with a pound sign (#) as a comment
* ignore lines that consist entirely of white-space

Example.lst:

	item1
	item2
	item3

	# Comment - both the above, current, and below lines are ignored.

	item4

### post/

post/ contains scripts named matching packages that are executed after the
package is installed.

### pre/

pre/ contains scripts named matching packages that are executed before the
package is installed.

### sequence/

Sequence contains standalone scripts that can refer to other directories and
files within the workstation type directory. These are executed directly by
provision.* in numerical order.

### provision.*

The primary script inside the workstation-type directory. It calls scripts
in numeric order from the sequence directory.

### Vagrantfile

Each workstation type contains a Vagrantfile for virtual testing. The
Vagrantfile should pass the workstation type as the first parameter to the
provision script in the parent directory.

## Executing

Executing provision.* will install preferred applications, customize selected
settings, and prepare a workstation for preferred tasks.

	./provision.*

## Testing

To test, open the workstation type directory in your terminal emulator and
start Vagrant.

	vagrant up
