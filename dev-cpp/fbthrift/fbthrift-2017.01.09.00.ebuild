# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1
inherit autotools-utils

DESCRIPTION="Thrift is a serialization and RPC framework for service communication."
HOMEPAGE="https://github.com/facebook/fbthrift"
inherit git-r3
EGIT_REPO_URI="https://github.com/facebook/fbthrift.git"
EGIT_COMMIT="f196863912abdc5959753bbaed8dd28a362a0844"
KEYWORDS="~amd64"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="static-libs"

DEPEND="dev-cpp/folly
	sys-process/numactl
	dev-cpp/wangle"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/thrift"

#src_configure() {
#	autotools-utils_src_prepare
#	PYTHON=2 PYTHON_VERSION=2 econf
#	#epatch "${FILESDIR}/gcc.patch"
#}
