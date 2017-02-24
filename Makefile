# Created by: mrhanky <mrhanky@unterschicht.tv>
# $FreeBSD$

PORTNAME=	pyload
PORTVERSION=	0.4.9
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	GH
DISTNAME=	${GH_ACCOUNT}-${GH_PROJECT}-${PORTVERSION}-${GH_TAGNAME}${GH_COMMIT}

MAINTAINER=	mrhanky@unterschicht.tv
COMMENT=	Lightweight one-click download manager written in python

LICENSE=	GPLv3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3 \
		${PYTHON_PKGNAMEPREFIX}pycurl>0:ftp/py-pycurl \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2 \
		${PYTHON_PKGNAMEPREFIX}thrift>=0.8.0:devel/py-thrift \
		${PYTHON_PKGNAMEPREFIX}beaker>0:www/py-beaker \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>=3.2:www/py-beautifulsoup

USE_GITHUB=	yes
GH_ACCOUNT=	pyload
GH_PROJECT=	pyload
GH_TAGNAME=	387669cb856fba4a70ca056051ba13b71415c09e

NO_BUILD=	yes
NO_ARCH=	yes
USES=gettext
USES=python
USE_SQLITE3=	yes

USE_RC_SUBR=	pyload
SUB_FILES=	pkg-message
BINARY_DIR=	${PREFIX}/bin
INSTALL_DIR=	${PREFIX}/share/${PORTNAME}

OPTIONS_DEFINE=	CRYPTO JSENGINE OPENSSL RSS TESSERACT UNPACK
OPTIONS_DEFAULT=CRYPTO JSENGINE UNPACK
CRYPTO_DESC=	Install py-pycrypto for RSDF/CCF/DLC support
JSENGINE_DESC=	Install spidermonkey JS engine for Click'n'load
RSS_DESC=	Install py-feedparser for RSS support
TESSERACT_DESC=	Image recognition provided by tesseract and py-pillow
UNPACK_DESC=	Install binaries for extracting .rar and .zip files

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MCRYPTO}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pycrypto>0:security/py-pycrypto
.endif

.if ${PORT_OPTIONS:MJSENGINE}
RUN_DEPENDS+=	spidermonkey24>0:lang/spidermonkey24
.endif

.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=	yes
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}openssl>0:security/py-openssl
.endif

.if ${PORT_OPTIONS:MRSS}
RUN_DEPENDS+=${PYTHON_PKGNAMEPREFIX}feedparser>0:textproc/py-feedparser
.endif

.if ${PORT_OPTIONS:MTESSERACT}
TESSERACT_LANGS=eng
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pillow>0:graphics/py-pillow \
		tesseract>0:graphics/tesseract \
		tesseract-data>0:graphics/tesseract-data
.endif

.if ${PORT_OPTIONS:MUNPACK}
RUN_DEPENDS+=	unrar>0:archivers/unrar \
		unzip>0:archivers/unzip
.endif

do-install:
	${MKDIR} ${STAGEDIR}${INSTALL_DIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${STAGEDIR}${INSTALL_DIR})
	${LN} -fs ${DATADIR}/pyLoadCore.py ${STAGEDIR}${BINARY_DIR}/pyload
	${LN} -fs ${DATADIR}/pyLoadCli.py ${STAGEDIR}${BINARY_DIR}/pyload-cli
	${LN} -fs ${DATADIR}/pyLoadGui.py ${STAGEDIR}${BINARY_DIR}/pyload-gui

post-install:
	(cd ${STAGEDIR}${PREFIX} \
	            && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
	                        -d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;})
.include <bsd.port.mk>
