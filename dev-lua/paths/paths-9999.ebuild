# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6



DESCRIPTION="Paths manipulation library for Lua."
HOMEPAGE="https://github.com/torch/paths"
EGIT_REPO_URI="https://github.com/torch/paths.git"
VCS="git"

inherit cmake-utils lua

GITHUB_A="torch"
GITHUB_PN="paths"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc luajit"

COMMON_DEPEND="
		!luajit? ( >=dev-lang/lua-5.1:= )
		luajit? ( dev-lang/luajit:2= )"
DEPEND="${COMMON_DEPEND}
		virtual/pkgconfig"
RDEPEND="${COMMON_DEPEND}"

each_lua_configure() {
	elog "============================"
	elog "$(lua_get_pkgvar LUA_INCDIR)"

	local mycmakeargs=(
		-DLUADIR="$(lua_get_pkgvar INSTALL_LMOD)"
		-DLIBDIR="$(lua_get_pkgvar INSTALL_LIB)"
		#-DLUA_BINDIR="$($(tc-getPKG_CONFIG) --variable INSTALL_BIN $(usex luajit 'luajit' 'lua'))"
		-DLUA_INCDIR="$(lua_get_pkgvar INSTALL_INC)"

		-DLUA_LIBDIR="$($(tc-getPKG_CONFIG) --variable INSTALL_CMOD $(usex luajit 'luajit' 'lua'))"
		#-DSCRIPTS_DIR="$($(tc-getPKG_CONFIG) --variable INSTALL_BIN $(usex luajit 'luajit' 'lua'))"
		-DLUALIB="`equery files luajit |grep lib64/libluajit | grep .so | awk 'NR==0; END{print}'`"
		#-DLUA="/usr/bin/luajit"
	)
	cmake-utils_src_configure

}

src_compile() { :; }

src_install() {
	cmake-utils_src_install
	mkdir -p "${D}"/usr/lib/lua/5.1 "${D}"/usr/share/lua/5.1/
	mv "${D}"/usr/lib64/libpaths.so "${D}"/usr/lib/lua/5.1/
	mv "${D}"/usr/lua/* "${D}"/usr/share/lua/5.1/
	rm -rf "${D}"/usr/lua
}
