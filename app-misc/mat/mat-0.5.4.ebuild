# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils gnome2-utils distutils-r1

DESCRIPTION="Metadata Anonymisation Toolkit"
HOMEPAGE="https://mat.boum.org/"
SRC_URI="https://mat.boum.org/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/python-distutils-extra[${PYTHON_USEDEP}]
	dev-python/hachoir-core[${PYTHON_USEDEP}]
	dev-python/hachoir-parser[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	dev-python/pdfrw[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/python-poppler[${PYTHON_USEDEP}]
	sys-apps/coreutils"

python_prepare() {
	sed -i -e "s#PDF#PDF;#g" mat.desktop || die
	sed -i -e "s#share/doc/${PN}#share/doc/${PF}#g" setup.py || die

	distutils-r1_python_prepare
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update

	elog "To get additional features, a number of optional runtime"
	elog "dependencies may be installed:"
	optfeature "massive audio format support" media-libs/mutagen
	optfeature "massive image format support" media-libs/exiftool
	optfeature "nautilus menu integration" dev-python/nautilus-python
}

pkg_postrm() {
	gnome2_icon_cache_update
}
