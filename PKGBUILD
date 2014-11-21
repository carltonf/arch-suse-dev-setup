# Maintainer: Carl Xiong <xiongc05@gmail.com>

pkgname=suse-dev-tools
_pkgname=${pkgname}
pkgver=0.2
pkgrel=2
# This package does following things:
# 1. Pull in various dependency packages.
# 2. Pull in various extra files, like RPM macros.
pkgdesc="A package bundles all necessary files for SUSE-related code reviewing."
arch=('i686' 'x86_64')
url="https://en.opensuse.org/Main_Page"
license=('GPL2')
# pulls in all necessary dependencies
depends=('rpm-org' 'osc')
optdepends=(
  'quilt: patch management'
)
conflicts=()
source=(
  "https://build.opensuse.org/source/openSUSE:Factory/rpm/rpm-suse_macros"
  "https://build.opensuse.org/source/openSUSE:Factory/glib2/macros.glib2"
)
md5sums=('4eb1284b4ca8b98f4256828156818f26'
         '166c8dd1a6b29bfdf7104a61a4934047')

# SUSE specials
suse_project='openSUSE:Factory'
# fake utilities: utilities that fakes are sufficient for reading code
# https://build.opensuse.org/package/show/openSUSE:Factory/gnome-patch-translation
# https://build.opensuse.org/package/show/openSUSE:Factory/translation-update-upstream
fake_suse_utilities=('gnome-patch-translation-prepare'
                     'gnome-patch-translation-update'
                     'translation-update-tool'
                     'translation-update-upstream')

prepare() {
  mkdir -pv ${_pkgname}-${pkgver}/

  # Handle special SUSE data
  sed -e '/@suse_version@/d' -e '/@sles_version@/d' -e '/@ul_version@/d'        \
      rpm-suse_macros > ${_pkgname}-${pkgver}/macros.suse
  cat <<EOF >> ${_pkgname}-${pkgver}/macros.suse
# Target Project configuration from OBS
`osc meta prjconf ${suse_project} | grep -E '^%(suse|sles|ul)_version'`
EOF
  for fu in "${fake_suse_utilities[@]}"; do
    cat <<EOF > ${_pkgname}-${pkgver}/"${fu}"
#!/bin/sh

echo 'INFO: This is a fake utility, for hacking only'
EOF
  done

  cp macros.glib2 ${_pkgname}-${pkgver}/
}

package() {
  # 'rpm --showrc' to find out the Macro path. Here we use
  # "/usr/lib/rpm/macros.d/macros.*"
  cd ${_pkgname}-${pkgver}/
  install -D -m 644 macros.suse ${pkgdir}/usr/lib/rpm/macros.d/macros.suse
  install -D -m 644 macros.glib2 ${pkgdir}/usr/lib/rpm/macros.d/macros.glib2

  for fu in "${fake_suse_utilities[@]}"; do
    # As fake utilities, maybe better in /usr/local
    install -D -m 755 "${fu}" ${pkgdir}/usr/local/bin/${fu}
  done
}
