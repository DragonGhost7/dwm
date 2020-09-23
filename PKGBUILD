# Maintainer: Me lmao
pkgname="dwm"
groups=('modified')
pkgver=r1735.c2e55d7
pkgrel=1
pkgdesc="dynamic window manager for X"
arch=('x86_64')
url='git.suckless.org/dwm'
license=('MIT')
depends=('libxft-bgra'
	'libx11'
	'libxinerama'
	'freetype2'
	'dmenu'
	'st'
)
makedepends=('git')
source=('dwm::git://github.com/DragonGhost7/dwm.git')
md5sums=('SKIP')

pkgver() {
cd "$pkgname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ./dwm "$pkgdir/usr/local/bin/dwm"
	install -Dm644 ./dwm.1 "$pkgdir/usr/local/man/man1/dwm.1"
}
