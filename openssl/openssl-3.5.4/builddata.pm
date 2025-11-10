package OpenSSL::safe::installdata;

use strict;
use warnings;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
    @PREFIX
    @libdir
    @BINDIR @BINDIR_REL_PREFIX
    @LIBDIR @LIBDIR_REL_PREFIX
    @INCLUDEDIR @INCLUDEDIR_REL_PREFIX
    @APPLINKDIR @APPLINKDIR_REL_PREFIX
    @ENGINESDIR @ENGINESDIR_REL_LIBDIR
    @MODULESDIR @MODULESDIR_REL_LIBDIR
    @PKGCONFIGDIR @PKGCONFIGDIR_REL_LIBDIR
    @CMAKECONFIGDIR @CMAKECONFIGDIR_REL_LIBDIR
    $VERSION @LDLIBS
);

our @PREFIX                     = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4' );
our @libdir                     = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4' );
our @BINDIR                     = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/apps' );
our @BINDIR_REL_PREFIX          = ( 'apps' );
our @LIBDIR                     = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4' );
our @LIBDIR_REL_PREFIX          = ( '' );
our @INCLUDEDIR                 = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/include', '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/include' );
our @INCLUDEDIR_REL_PREFIX      = ( 'include', './include' );
our @APPLINKDIR                 = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/ms' );
our @APPLINKDIR_REL_PREFIX      = ( 'ms' );
our @ENGINESDIR                 = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/engines' );
our @ENGINESDIR_REL_LIBDIR      = ( 'engines' );
our @MODULESDIR                 = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4/providers' );
our @MODULESDIR_REL_LIBDIR      = ( 'providers' );
our @PKGCONFIGDIR               = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4' );
our @PKGCONFIGDIR_REL_LIBDIR    = ( '.' );
our @CMAKECONFIGDIR             = ( '/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-3.5.4' );
our @CMAKECONFIGDIR_REL_LIBDIR  = ( '.' );
our $VERSION                    = '3.5.4';
our @LDLIBS                     =
    # Unix and Windows use space separation, VMS uses comma separation
    $^O eq 'VMS'
    ? split(/ *, */, '-ldl -pthread ')
    : split(/ +/, '-ldl -pthread ');

1;
