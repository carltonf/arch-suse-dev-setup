# Maintainer: Carl Xiong <xiongc05@gmail.com>

pkgname=suse-dev-tools
_pkgname=${pkgname}
pkgver=0.1
pkgrel=1
pkgdesc="A package bundles all necessary files for SUSE-related package development, mainly for code reviewing."
arch=('i686' 'x86_64')
url="https://en.opensuse.org/Main_Page"
license=('GPL2')
# pulls in all necessary dependencies
depends=('rpm-org')
optdepends=(
  'quilt: patch management'
  'osc: CLI tool for Open Build Service'
)
conflicts=()
source=("https://build.opensuse.org/source/openSUSE:Factory/rpm/rpm-suse_macros")
md5sums=('4eb1284b4ca8b98f4256828156818f26')

prepare() {
  mkdir -pv ${srcdir}/${_pkgname}-${pkgver}/
  cp ${srcdir}/rpm-suse_macros ${srcdir}/${_pkgname}-${pkgver}/
}

# build() {
#   # for now nothing else
# }

package() {
  # cd ${srcdir}/${_pkgname}-${pkgver}

  install -D -m 644 rpm-suse_macros ${pkgdir}/usr/lib/rpm/suse_macros
}
