%define version 0.2.1

Name:           haxxeptance
Version:        %{version}
Release:        1%{?dist}
Summary:        URL scheme handler to open hxxp: and hxxps: URLs

License:        GPL
URL:            https://github.com/dpoon/haxxeptance
Source0:        https://github.com/dpoon/haxxeptance/archive/v%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  make
Requires:       /usr/bin/xdg-open

%description
Haxxeptance is a URL scheme handler that accepts hxxp: and hxxps: URLs and
opens them in the default web browser as http: and https: URLs.

%prep
%autosetup


%build
%make_build -C freedesktop


%install
rm -rf $RPM_BUILD_ROOT
%make_install -C freedesktop


%files
%defattr(-, root, root, 0755)
%license LICENSE
%{_bindir}/hxxp-open
%{_datadir}/applications/haxxeptance.desktop
%{_mandir}/man1/hxxp-open.1*


%changelog
* Sun May  3 2020 Dara Poon <github@dwpoon.com>
- Initial packaging
