PKGBUILDS = $(shell find . -name PKGBUILD)

all:
	@echo "check: use 'namcap' to check PKGBUILD"
	@echo "tarball: mkaurball, define PKGDIR' first."
	@echo "clean: clean extra files"

check: ${PKGBUILDS}
	namcap ${PKGBUILDS}

tarball:
	@if [ -n "${pkgdir}" ]; then						\
	   cd ${pkgdir};							\
	   mkaurball;								\
	else									\
	   echo "Error: 'pkgdir' not defined, the package to make tarball.";	\
	fi

clean:
	@git clean -xfd
