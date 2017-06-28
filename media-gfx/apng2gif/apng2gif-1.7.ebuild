# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="create a GIF from an APNG"
HOMEPAGE="https://sourceforge.net/projects/apng2gif/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}-src.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/zlib
	media-libs/libpng:0="
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}

src_prepare() {
	local PATCHES=( "${FILESDIR}"/${PN}-1.6-makefile.patch )
	default

	rm -rf libpng zlib || die
	tc-export CXX
}

src_install() {
	dobin ${PN}
	dodoc readme.txt
}
