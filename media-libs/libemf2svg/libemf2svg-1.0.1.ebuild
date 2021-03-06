# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils cmake-utils

DESCRIPTION="Microsoft (MS) EMF to SVG conversion library"
HOMEPAGE="https://github.com/kakwa/libemf2svg"
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kakwa/libemf2svg.git"
	EGIT_REPO_COMMIT="8df7059bc1e63e1960415ce790a18a5492114287"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="static-libs"

DEPEND="virtual/libiconv
	media-libs/libpng"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/"
# Causing issue - ${PN}"

#PATCHES=( "${FILESDIR}/${PN}-0.57.0-really-fix-boost161.diff" )

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr/
	)
	cmake-utils_src_configure
}
