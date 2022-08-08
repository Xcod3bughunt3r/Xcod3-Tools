<p align="left"><a href="https://www.itsecurity.id/"><img height="150" title="Xcod3bughunt3r" src="0011.png"/></a></p>

# ``Android Tools``
#### ``Git repositori untuk memudahkan paket utilitas baris perintah tertentu yang disediakan oleh`` [Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r).

## ``Motivation``
#### [Many](https://www.itsecurity.id/) [Linux](https://www.arch.org/) [distributions](https://www.kali.org/) ``Memiliki paket yang disebut Android-Tools yang mengirimkan alat baris perintah Android penting yang penting seperti ADB atau FastBoot. Sayangnya sistem build hulu untuk alat-alat itu agak kompleks dan tidak memungkinkan untuk membangun alat baris perintah saja. Oleh karena itu distribusi Linux sebagian besar mengirimkan sistem bangunan mereka sendiri untuk membangun utilitas baris perintah. Repositori ini bertujuan untuk membuat kemasan utilitas perintah android dengan mudah dengan menyediakan sistem build berbasis Cmake sederhana dan tarball siap pakai yang tidak memerlukan kloning semua repositori git yang diperlukan secara manual. Selain itu membuatnya mudah untuk mengumpulkan semua tambalan yang diperlukan untuk membangun utilitas baris perintah android mandiri di tempat sentral.``

## ``Status``
#### ``Saat ini alat berikut didukung:``
* ``adb``
* ``fastboot``
* ``mke2fs.android (required by fastboot)``
* ``simg2img, img2simg, append2simg``
* ``lpdump, lpmake, lpadd, lpflash, lpunpack``
* ``mkbootimg, unpack_bootimg, repack_bootimg``

#### ``Sistem build itu sendiri berfungsi dengan baik dan sudah digunakan untuk paket Alpine Linux Android-tools yang saya pertahankan. Saya pribadi tidak menggunakan alat-alat Android apa pun kecuali adb dan fastboot. Dengan demikian motivasi saya untuk menambah dukungan untuk alat tambahan agak rendah saat ini. Namun, tambalan yang menambahkan dukungan untuk alat baru dengan cara yang bersih dipersilakan. Selain itu, tambalan yang diperlukan untuk membuat perangkat lunak mengkompilasi pada distribusi Linux lainnya juga dipersilakan. Silakan buat tambalan baru menggunakan``.
* ``git format-patch --no-numbered --no-signature …``.

## ``Dependencies``
#### ``Perpustakaan berikut diperlukan oleh Android-Tools:``
1. [libusb](libusb)
2. [PCRE](PCRE)
3. [Google Test](gtest)
4. [protobuf](protobuf)
5. [brotli](brotli)
6. [zstd](zstd)
7. [lz4](lz4)

#### ``Python 3 secara opsional diperlukan sebagai ketergantungan run-time untuk menggunakan skrip `mkbootimg`,` unpack_bootimg`, dan `repack_bootimg` yang semuanya ditulis dalam Python. Selain itu, perangkat lunak berikut diperlukan pada waktu kompilasi:``
1. A C and C++ compiler (either [GCC](gcc) >= 10.X or [clang](clang))
2. The [Go compiler](golang)
3. [CMake](cmake)
4. [Perl](perl)

#### ``Saat ini sistem build tidak memeriksa apakah semua ini diinstal.``

## ``Installation``
#### ``Sumber tarball yang berisi versi yang sudah ditambal dari semua dependensi vendored tersedia pada`` [GitHub Release Page](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r). ``Tarbol ini harus digunakan untuk pengemasan dan instalasi umum. Setelah tarball diunduh dan diekstraksi Android-Tools dapat dibuat dan diinstal sebagai berikut:``
* ``mkdir build && cd build``
* ``cmake ..``
* ``make``
* ``make install``

## ``Generating tarballs``
#### ``Tarbol sumber baru dapat dibuat dari git repositori menggunakan:``
* ``mkdir build && cd build``
* ``cmake ..``
* ``make package_source``

#### ``Sebelum rilis baru diunggah `git-tag (1)` harus dibuat untuk rilis. Setelah itu tarball dapat diunggah ke`` [GitHub Release Page](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r).

## ``See also``
#### ``The Arch Linux`` [Android Tools package](https://www.arch.org/) ``by`` [Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r) ``yang menginspirasi proyek ini. Sebagian besar definisi dalam `cmakelis.txt` telah disalin dari skrip Ruby Anatol.``

##### [android-tools](https://sites.google.com/a/android.com/tools/) - [void-linux](https://github.com/void-linux/void-packages/tree/master/srcpkgs/android-tools) - [arch-linux](https://www.archlinux.org/packages/community/x86_64/android-tools/) - [alpine-linux](https://pkgs.alpinelinux.org/package/edge/testing/x86_64/android-tools) - [Xcod3-AnTools](https://github.com/Xcod3bughunt3r/Xcod3-Tools/Xcod3-AnTools) - [libusb](http://libusb.info/) - [PCRE](http://pcre.sourceforge.net/) - [gtest](https://github.com/google/googletest) - [gcc](https://gcc.gnu.org/) - [clang](https://llvm.org/) - [golang](https://golang.org/) - [cmake](https://cmake.org/) - [perl](https://www.perl.org/) - [protobuf](https://github.com/protocolbuffers/protobuf) - [brotli](https://github.com/google/brotli) - [zstd](https://facebook.github.io/zstd/) - [lz4](https://github.com/lz4/lz4) - [anatol.pomozov](https://github.com/anatol)

## ``DEVELOPERS:``*[Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r)*.
